import 'package:flutter/material.dart';
import '../services/ml_service.dart';
import '../services/disease_service.dart';
import '../models/disease_model.dart';
import 'package:image_picker/image_picker.dart';
import '../views/diagnostic_result.dart';

class ScannerViewModel extends ChangeNotifier {
  final MLService _mlService = MLService();
  final ImagePicker _picker = ImagePicker();

  // Constraint Check: Using a Map instead of an Array for History
  // Key = Timestamp string, Value = Map of scan data
  static final Map<String, Map<String, dynamic>> scanHistoryMap = {};

  String? _imagePath;
  String? _detectedDiseaseId;
  bool _isProcessing = false;
  double _confidenceLevel = 0.0;
  DiseaseModel? _diseaseModel;
  String? _scanDate; // 📦 Added dynamic date variable

  DiseaseModel? get diseaseModel => _diseaseModel;
  double get confidenceLevel => _confidenceLevel;
  String? get scannedImagePath => _imagePath;
  String? get detectedDiseaseId => _detectedDiseaseId;
  bool get isProcessing => _isProcessing;
  String? get scanDate => _scanDate; // Getter for the UI

  // 1. UPDATE THIS: Gallery picker logic becomes much cleaner
  Future<void> pickAndProcessImage(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      await initViewModel();

      // Because we moved the logic, this single line now does the ML,
      // generates the date, AND saves to history!
      await processPhoto(image.path);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiagnosticResult(
              isFromScanner: true,
              imagePath: image.path,
              disease: diseaseModel,
              confidenceLevel: confidenceLevel,
              scanDate: scanDate, // Passes the fresh date
            ),
          ),
        );
      }
    }
  }

  Future<void> initViewModel() async {
    await _mlService.initialize();
  }

  // 2. UPDATE THIS: Make processPhoto handle the date and saving
  Future<void> processPhoto(String path) async {
    _imagePath = path;
    _isProcessing = true;
    notifyListeners();

    final result = await _mlService.predictDisease(path);

    if (result != null) {
      _detectedDiseaseId = result["label"] as String?;
      _confidenceLevel = (result["confidence"] as num).toDouble();
      _diseaseModel = DiseaseService.getDiseaseById(_detectedDiseaseId!);

      // Generate the pretty date for the UI
      _scanDate = _generateDynamicDate();

      // THE FIX: Generate a 100% unique key using the exact millisecond!
      final String uniqueKey = DateTime.now().millisecondsSinceEpoch.toString();

      // Save to the Map using the unique key so nothing ever gets overwritten
      scanHistoryMap[uniqueKey] = {
        'disease': _diseaseModel,
        'imagePath': path,
        'confidence': _confidenceLevel,
        'date': _scanDate, // The pretty date is saved inside the value
      };

      print("🔥 AI DETECTED: $_detectedDiseaseId");
      print("💾 Scan saved to history! Total scans: ${scanHistoryMap.length}");
    }

    _isProcessing = false;
    notifyListeners();
  }


  // ==========================================
  // Custom Date Formatter (No extra packages needed)
  // ==========================================
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