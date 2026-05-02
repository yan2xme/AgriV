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
      // Return your UI (a Widget)
      return Stack(
        children: [
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
                        padding: EdgeInsets.only(top: 2),
                        width: 100,
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
                        child: Text(
                          'DETECT',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: -10,
            right: 0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LiquidGlassLayer(
                  child: LiquidGlass(
                    shape: LiquidRoundedSuperellipse(borderRadius: 30),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.flash_on),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
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
                          async: cameraState.when(
                            onPhotoMode: (photoState) async {
                              final CaptureRequest request = await photoState.takePhoto();

                              print("Photo saved at: ${request.path}");

                              final testScanner = ScannerViewModel();
                              await testScanner.initViewModel(); // Boot up the ML brain
                              await testScanner.processPhoto(request.path!); // Feed it the image


                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiagnosticResult(
                                        isFromScanner: true,
                                        imagePath: testScanner.scannedImagePath,
                                        detectedDiseaseId: testScanner.detectedDiseaseId,
                                        confidenceLevel: testScanner.confidenceLevel // <-- Pass the cache path here
                                    ),
                                  ),
                                );
                              }

                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(35),
                          iconSize: 40,
                          shape: CircleBorder(),
                          backgroundColor:
                              Colors.transparent, // <-- Splash color
                        ),
                        child: Icon(Icons.camera, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // An empty SizedBox here helps perfectly center the green button
                // if your flashlight is only on the left side
                const SizedBox(width: 48),
              ],
            ),
          ),
        ],
      );
    },
    saveConfig: .photo(),
  );
}

extension on BuildContext {
  void read() {}
}
