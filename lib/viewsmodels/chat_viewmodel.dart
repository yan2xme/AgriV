import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;

class ChatViewModel extends ChangeNotifier {
  // Constraint: Using a Map instead of an array/List
  final Map<DateTime, Map<String, dynamic>> _chatHistory = {};
  Map<DateTime, Map<String, dynamic>> get chatHistory => _chatHistory;

  late final GenerativeModel _model;
  final ImagePicker _picker = ImagePicker();

  ChatViewModel() {
    // Securely load the API key
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null) throw Exception('API key not found in .env');

    _model = GenerativeModel(
      model: 'gemini-3.1-flash-lite-preview',
      apiKey: apiKey,
      systemInstruction: Content.system(
          "Isa kang expert agricultural AI assistant para sa app na AgriVysor."
              "Mag-provide ng direct-to-the-point at makabuluhang advice para sa mga farmers regarding plant diseases."
      ),
    );
  }

  // Initial prompt builder using passed data
// Update this signature to accept the imagePath
  void initializeChat(String diseaseName, String description, String? imagePath) {
    if (_chatHistory.isNotEmpty) return;

    final initialPrompt = "Disease: $diseaseName\n\nDescription: $description\n\nProvide more insights about the disease and treatment.";

    // If an imagePath exists, convert it to an XFile and send it
    XFile? initialImage;
    if (imagePath != null) {
      initialImage = XFile(imagePath);
    }

    sendMessage(initialPrompt, isUser: true, image: initialImage);
  }

  Future<void> _generateAIResponse(String prompt, {String? imagePath}) async {
    try {
      final responseKey = DateTime.now();
      _chatHistory[responseKey] = {'text': 'Thinking...', 'isUser': false};
      notifyListeners();

      final List<Part> parts = [TextPart(prompt)];

      if (imagePath != null) {
        Uint8List imageBytes;

        // 1. Check if the image is a bundled asset (from Library)
        if (imagePath.startsWith('lib/') || imagePath.startsWith('assets/')) {
          try {
            // Load bytes directly from the app bundle
            final byteData = await rootBundle.load(imagePath);
            imageBytes = byteData.buffer.asUint8List();
          } catch (e) {
            print("🚨 ERROR: Asset missing from bundle: $imagePath");
            throw Exception("Asset missing");
          }
        }
        // 2. Otherwise, it's a real file (from Camera/Scanner)
        else {
          final file = File(imagePath);
          if (!await file.exists()) {
            print("🚨 ERROR: Image file not found at path: $imagePath");
            throw Exception("Image file missing");
          }
          imageBytes = await file.readAsBytes();
        }

        // 3. Dynamically determine the mime type
        String mimeType = 'image/jpeg';
        if (imagePath.toLowerCase().endsWith('.png')) {
          mimeType = 'image/png';
        } else if (imagePath.toLowerCase().endsWith('.webp')) {
          mimeType = 'image/webp';
        }

        parts.add(DataPart(mimeType, imageBytes));
      }

      final response = await _model.generateContent([Content.multi(parts)]);

      _chatHistory[responseKey] = {
        'text': response.text ?? 'I could not process that request.',
        'isUser': false
      };
      notifyListeners();

    } catch (e) {
      print("🚨 GEMINI API ERROR: $e");
      _chatHistory[DateTime.now()] = {
        'text': 'Pasensya na, may error sa pag-connect o pagbasa ng image. Please try again.',
        'isUser': false
      };
      notifyListeners();
    }
  }

  // And don't forget to pass the imagePath to the generator from sendMessage!
  Future<void> sendMessage(String text, {required bool isUser, XFile? image}) async {
    if (text.trim().isEmpty && image == null) return;

    _chatHistory[DateTime.now()] = {
      'text': text,
      'isUser': isUser,
      'imagePath': image?.path,
    };
    notifyListeners();

    if (isUser) {
      // Pass the image path here so the AI can process it
      await _generateAIResponse(text, imagePath: image?.path);
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      sendMessage("Can you analyze this image?", isUser: true, image: image);
    }
  }
}