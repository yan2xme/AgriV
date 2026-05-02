import 'package:flutter/material.dart';
import '../services/ml_service.dart';

class ScannerViewModel extends ChangeNotifier {
  final MLService _mlService = MLService();

  String? _imagePath;
  String? _detectedDiseaseId;
  bool _isProcessing = false;
  double _confidenceLevel = 0.0;

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

      print("🔥 AI DETECTED: $_detectedDiseaseId with ${_confidenceLevel.toStringAsFixed(1)}% confidence 🔥");
    }

    _isProcessing = false;
    notifyListeners(); // Tell the UI to route to the Results screen!
  }
}
