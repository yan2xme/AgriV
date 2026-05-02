import 'package:flutter/material.dart';
import '../services/ml_service.dart';
import '../services/disease_service.dart';
import '../models/disease_model.dart';
import 'package:image_picker/image_picker.dart';

import '../views/diagnostic_result.dart';

class ScannerViewModel extends ChangeNotifier {
  final MLService _mlService = MLService();

  final ImagePicker _picker = ImagePicker();
  static List<DiseaseModel> scanHistory = [];

  Future<void> pickAndProcessImage(BuildContext context) async {
    // 1. Buksan ang gallery
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (diseaseModel != null) {
      scanHistory.insert(0, diseaseModel!); // Puts the newest scan at the top
    }

    if (image != null) {
      // 2. Simulan ang "brain" (ML Model)
      await initViewModel();

      // 3. I-process ang napiling image
      await processPhoto(image.path);

      // 4. Pagkatapos ma-detect, lumipat sa DiagnosticResult
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiagnosticResult(
              isFromScanner: true,
              imagePath: image.path,
              disease: diseaseModel,
              confidenceLevel: confidenceLevel,
            ),
          ),
        );
      }
    }
  }

  String? _imagePath;
  String? _detectedDiseaseId;
  bool _isProcessing = false;
  double _confidenceLevel = 0.0;

  // Add this one! 📦
  DiseaseModel? _diseaseModel;

  // And the getter so the UI can read it:
  DiseaseModel? get diseaseModel => _diseaseModel;

  double get confidenceLevel => _confidenceLevel; // Add getter!

  String? get scannedImagePath => _imagePath;

  String? get detectedDiseaseId => _detectedDiseaseId;

  bool get isProcessing => _isProcessing;

  // Call this when the app starts!
  Future<void> initViewModel() async {
    await _mlService.initialize();
  }

  // Call this on your Camera Button's onTap!
  Future<void> processPhoto(String path) async {
    _imagePath = path;
    _isProcessing = true;
    notifyListeners(); // Show loading spinner on UI

    // Catch the Map!
    final result = await _mlService.predictDisease(path);

    if (result != null) {
      _detectedDiseaseId = result["label"] as String?;
      _confidenceLevel = (result["confidence"] as num).toDouble();

      _diseaseModel = DiseaseService.getDiseaseById(_detectedDiseaseId!);

      print(
        "🔥 AI DETECTED: $_detectedDiseaseId with ${_confidenceLevel.toStringAsFixed(1)}% confidence 🔥",
      );
    }

    _isProcessing = false;
    notifyListeners(); // Tell the UI to route to the Results screen!
  }
}
