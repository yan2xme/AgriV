import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_litert/flutter_litert.dart';
import 'package:image/image.dart' as img;

class MLService {
  Interpreter? _interpreter;
  List<String> _labels = [];

  // 1. Boot up the brain
  Future<void> initialize() async {
    // flutter_litert makes this incredibly easy now
    _interpreter = await Interpreter.fromAsset('lib/views/assets/ml/plantmodel_MNv3.tflite');

    // Load your 33 classes
    final labelData = await rootBundle.loadString('lib/views/assets/ml/labels.txt');
    _labels = labelData.split('\n');
    _labels = labelData.split('\n');
  }

  // 2. Process the camera image
  Future<Map<String, Object>?> predictDisease(String imagePath) async {
    if (_interpreter == null) return null;

    // Read the file the camera just saved
    final imageData = File(imagePath).readAsBytesSync();
    img.Image? image = img.decodeImage(imageData);
    if (image == null) return null;

    // MobileNetV3 usually needs exactly 224x224 pixels
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Convert the image into the mathematical array the TFLite model expects
    // Assuming unquantized (Float32) model where colors are 0.0 to 1.0
    var input = List.generate(1, (i) => List.generate(224, (y) => List.generate(224, (x) {
      final pixel = resizedImage.getPixel(x, y);
      return [
        pixel.r.toDouble() / 255.0,
        pixel.g.toDouble() / 255.0,
        pixel.b.toDouble() / 255.0,
      ];
    })));

    // Prepare an empty array for the 32 possible answers
    var output = List.filled(1, List.filled(32, 0.0));

    // Run the actual AI!
    _interpreter!.run(input, output);

    // Find the highest score among the 33 classes
    double highestScore = 0;
    int highestIndex = 0;

    for (int i = 0; i < output[0].length; i++) {
      if (output[0][i] > highestScore) {
        highestScore = output[0][i];
        highestIndex = i;
      }
    }

    // Return the winning label (e.g., "Banana Sigatoka")
    return {
      "label": _labels[highestIndex].trim(),
      "confidence": highestScore * 100, // Converts 0.85 to 85.0
    };
  }
}