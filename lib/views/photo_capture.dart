import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'diagnostic_result.dart';
import 'package:agrivysor_ryzen/viewsmodels/scanner_viewmodel.dart';

class PhotoCapture extends StatelessWidget {
  const PhotoCapture({super.key});

  @override
  Widget build(BuildContext context) => CameraAwesomeBuilder.custom(
    builder: (cameraState, photo) {
      return Stack(
        children: [
          // ==========================================
          // TOP DETECT BUTTON
          // ==========================================
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: LiquidGlassLayer(
                child: LiquidGlass(
                  shape: LiquidRoundedSuperellipse(borderRadius: 30),
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 2),
                        width: 100,
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                        child: const Text(
                          'DETECT',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ==========================================
          // BOTTOM CONTROLS
          // ==========================================
          Positioned(
            bottom: 50,
            left: -10,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // REFACTORED: Strict On/Off Flash Toggle
                LiquidGlassLayer(
                  child: LiquidGlass(
                    shape: LiquidRoundedSuperellipse(borderRadius: 30),
                    child: StreamBuilder<FlashMode>(
                      stream: cameraState.sensorConfig.flashMode$,
                      builder: (context, snapshot) {
                        final flashMode = snapshot.data ?? FlashMode.none;

                        // We treat anything that isn't 'on' as 'off' for the icon
                        final isFlashOn = flashMode == FlashMode.on;

                        return IconButton(
                          iconSize: 30,
                          icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
                          color: Colors.white,
                          onPressed: () {
                            // Explicitly toggle between only two states
                            if (isFlashOn) {
                              cameraState.sensorConfig.setFlashMode(FlashMode.none);
                            } else {
                              cameraState.sensorConfig.setFlashMode(FlashMode.on);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),

                // Capture Button
                GestureDetector(
                  child: Stack(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.0, 1.0],
                            colors: [
                              Colors.green.shade400,
                              Colors.green.shade200,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cameraState.when(
                            onPhotoMode: (photoState) async {
                              final CaptureRequest request = await photoState.takePhoto();

                              final testScanner = ScannerViewModel();
                              await testScanner.initViewModel();
                              await testScanner.processPhoto(request.path!);

                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiagnosticResult(
                                      isFromScanner: true,
                                      imagePath: testScanner.scannedImagePath,
                                      detectedDiseaseId: testScanner.detectedDiseaseId,
                                      confidenceLevel: testScanner.confidenceLevel,
                                      disease: testScanner.diseaseModel,
                                      scanDate: testScanner.scanDate,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(35),
                          iconSize: 40,
                          shape: const CircleBorder(),
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Icon(Icons.camera, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 48),
              ],
            ),
          ),
        ],
      );
    },
    saveConfig: SaveConfig.photo(),
  );
}