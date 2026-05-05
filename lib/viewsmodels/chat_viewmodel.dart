import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ChatViewModel extends ChangeNotifier {
  final Map<DateTime, Map<String, dynamic>> _chatHistory = {};
  Map<DateTime, Map<String, dynamic>> get chatHistory => _chatHistory;

  late final GenerativeModel _model;
  final ImagePicker _picker = ImagePicker();

  ChatViewModel() {
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

  // ==========================================
  // HELPER: Determine accurate MIME type via Magic Numbers
  // ==========================================
  String _determineMimeType(Uint8List bytes) {
    if (bytes.length >= 3 && bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
      return 'image/jpeg';
    }
    if (bytes.length >= 4 && bytes[0] == 0x89 && bytes[1] == 0x50 && bytes[2] == 0x4E && bytes[3] == 0x47) {
      return 'image/png';
    }
    if (bytes.length >= 12 && bytes[0] == 0x52 && bytes[1] == 0x49 && bytes[2] == 0x46 && bytes[3] == 0x46) {
      return 'image/webp';
    }
    return 'image/jpeg'; // Ultimate fallback
  }

  // ==========================================
  // HELPER: Persist image bypassing Android locks
  // ==========================================
  Future<String?> _persistImageLocally(String? imagePath) async {
    if (imagePath == null) return null;
    if (imagePath.startsWith('lib/') || imagePath.startsWith('assets/')) return imagePath;

    try {
      // Use XFile to extract bytes natively, bypassing Scoped Storage locks
      final xFile = XFile(imagePath);
      final bytes = await xFile.readAsBytes();

      if (bytes.isEmpty) {
        print("🚨 XFile read 0 bytes from cache!");
        return imagePath;
      }

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = imagePath.split('/').last;
      final permanentFile = File('${appDir.path}/$fileName');

      await permanentFile.writeAsBytes(bytes);
      return permanentFile.path;
    } catch (e) {
      print("🚨 Error saving image permanently: $e");
      return imagePath;
    }
  }

  // ==========================================
  // CORE CHAT LOGIC
  // ==========================================
  void clearHistory() {
    _chatHistory.clear();
    notifyListeners();
  }

  void initializeChat(String diseaseName, String description, String? imagePath) {
    if (diseaseName.isEmpty && imagePath == null) return;
    if (_chatHistory.isNotEmpty) return;

    final initialPrompt = "Disease: $diseaseName\n\nDescription: $description\n\nProvide more insights about the disease and treatment.";

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

        if (imagePath.startsWith('lib/') || imagePath.startsWith('assets/')) {
          final byteData = await rootBundle.load(imagePath);
          imageBytes = byteData.buffer.asUint8List();
        } else {
          // Use XFile to safely read the bytes without triggering permission errors
          final xFile = XFile(imagePath);
          imageBytes = await xFile.readAsBytes();
        }

        if (imageBytes.isEmpty) {
          throw Exception("Image bytes are empty! Android blocked the read.");
        }

        String mimeType = _determineMimeType(imageBytes);
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

  Future<void> sendMessage(String text, {required bool isUser, XFile? image}) async {
    if (text.trim().isEmpty && image == null) return;

    final safeImagePath = await _persistImageLocally(image?.path);

    final requestKey = DateTime.now();
    _chatHistory[requestKey] = {
      'text': text,
      'isUser': isUser,
      'imagePath': safeImagePath,
    };
    notifyListeners();

    if (isUser) {
      await _generateAIResponse(text, imagePath: safeImagePath);
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 1024,
    );

    if (image != null) {
      sendMessage("Can you analyze this image?", isUser: true, image: image);
    }
  }
}