import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import 'diagnostic_result.dart';

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
                              // This actually snaps the picture!
                              final CaptureRequest request = await photoState.takePhoto();

                              // request.path holds the location of the saved image.
                              print("Photo saved at: ${request.path}");

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiagnosticResult(
                                    isFromScanner: true,
                                    imagePath: request.path, // <-- Pass the cache path here
                                  ),
                                ),
                              );
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
