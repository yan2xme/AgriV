import 'dart:io';
import 'package:flutter/material.dart';
import '../services/ml_service.dart';
import '../services/disease_service.dart';
import '../models/disease_model.dart';
import 'package:image_picker/image_picker.dart';
import '../views/diagnostic_result.dart';
import 'package:hive_flutter/hive_flutter.dart';       // 🆕 Added Hive
import 'package:path_provider/path_provider.dart';   // 🆕 Added Path Provider

class ScannerViewModel extends ChangeNotifier {

  final MLService _mlService = MLService();
  final ImagePicker _picker = ImagePicker();


  // ==========================================
  // HELPER: Wipe all history (RAM + Disk)
  // ==========================================
  static Future<void> clearAllHistory() async {
    scanHistoryMap.clear();        // 1. Wipe the RAM
    await _scannerBox.clear();     // 2. Wipe the Hive Disk!
  }
  // RAM Storage: Using a Map instead of an Array for History
  // Key = Timestamp string, Value = Map of scan data
  static final Map<String, dynamic> scanHistoryMap = {};

  // 🆕 DISK STORAGE: Connect to the Hive Box
  static final Box _scannerBox = Hive.box('scanner_history');

  String? _imagePath;
  String? _detectedDiseaseId;
  bool _isProcessing = false;
  double _confidenceLevel = 0.0;
  DiseaseModel? _diseaseModel;
  String? _scanDate;

  DiseaseModel? get diseaseModel => _diseaseModel;
  double get confidenceLevel => _confidenceLevel;
  String? get scannedImagePath => _imagePath;
  String? get detectedDiseaseId => _detectedDiseaseId;
  bool get isProcessing => _isProcessing;
  String? get scanDate => _scanDate;

  // ==========================================
  // 🆕 HIVE LOAD LOGIC (Runs when app starts)
  // ==========================================
  static void loadHistoryFromHive() {
    try {
      if (_scannerBox.isNotEmpty) {
        // Sort keys to ensure chronological order
        final keys = _scannerBox.keys.toList()..sort();

        for (var key in keys) {
          final rawData = _scannerBox.get(key) as Map;

          // Rebuild the DiseaseModel from the saved ID
          final diseaseId = rawData['diseaseId'] as String;
          final diseaseModel = DiseaseService.getDiseaseById(diseaseId);

          // Put it back into the RAM Map for the UI
          scanHistoryMap[key.toString()] = {
            'disease': diseaseModel,
            'imagePath': rawData['imagePath'],
            'confidence': rawData['confidence'],
            'date': rawData['date'],
          };
        }
      }
    } catch (e) {
      print("🚨 Scanner Hive Load Error: $e");
    }
  }

  // ==========================================
  // 🆕 PERMANENT IMAGE COPIER (Stops iOS/Android from deleting tmp files)
  // ==========================================
  Future<String?> _persistImageLocally(String? imagePath) async {
    if (imagePath == null) return null;

    // Ignore bundled library assets
    if (imagePath.startsWith('lib/') || imagePath.startsWith('assets/')) return imagePath;

    try {
      final originalFile = File(imagePath);
      if (!await originalFile.exists()) return imagePath;

      // Get safe permanent directory
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = imagePath.split('/').last;

      // Copy the image out of the volatile 'tmp' folder
      final savedImage = await originalFile.copy('${appDir.path}/$fileName');
      return savedImage.path;

    } catch (e) {
      print("🚨 Error saving scanner image permanently: $e");
      return imagePath;
    }
  }

  // ==========================================
  // EXISTING LOGIC (Now upgraded with Hive!)
  // ==========================================
  Future<void> pickAndProcessImage(BuildContext context) async {
    // 🛠️ THE FIX: Compress the scanner images too!
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 1024,
    );

    if (image != null) {
      await initViewModel();
      await processPhoto(image.path);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiagnosticResult(
              isFromScanner: true,
              imagePath: scannedImagePath,
              disease: diseaseModel,
              confidenceLevel: confidenceLevel,
              scanDate: scanDate,
            ),
          ),
        );
      }
    }
  }

  Future<void> initViewModel() async {
    await _mlService.initialize();
  }

  Future<void> processPhoto(String path) async {
    _imagePath = path;
    _isProcessing = true;
    notifyListeners();

    final result = await _mlService.predictDisease(path);

    if (result != null) {
      _detectedDiseaseId = result["label"] as String?;
      _confidenceLevel = (result["confidence"] as num).toDouble();
      _diseaseModel = DiseaseService.getDiseaseById(_detectedDiseaseId!);
      _scanDate = _generateDynamicDate();

      // 1. 🆕 Make the image permanent!
      final safeImagePath = await _persistImageLocally(path);
      _imagePath = safeImagePath; // Update the getter so the UI uses the safe path

      // 2. Generate unique key
      final String uniqueKey = DateTime.now().millisecondsSinceEpoch.toString();

      // 3. Save to RAM Map (using the safe image path)
      scanHistoryMap[uniqueKey] = {
        'disease': _diseaseModel,
        'imagePath': safeImagePath,
        'confidence': _confidenceLevel,
        'date': _scanDate,
      };

      // 4. 🆕 Save to HIVE DISK!
      await _scannerBox.put(uniqueKey, {
        'diseaseId': _detectedDiseaseId, // Save just the ID, not the object!
        'imagePath': safeImagePath,
        'confidence': _confidenceLevel,
        'date': _scanDate,
      });

      print("🔥 AI DETECTED: $_detectedDiseaseId");
      print("💾 Scan saved to Hive History! Total scans: ${scanHistoryMap.length}");
    }

    _isProcessing = false;
    notifyListeners();
  }

  String _generateDynamicDate() {
    final now = DateTime.now();
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    final month = months[now.month - 1];
    final day = now.day;
    final year = now.year;

    int hour = now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';

    if (hour == 0) hour = 12;
    if (hour > 12) hour -= 12;

    return '$month $day, $year $hour:$minute $period';
  }
}