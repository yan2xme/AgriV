import 'package:flutter/material.dart';
import 'components/disease_card.dart';

class PhotoCapture extends StatelessWidget {
  const PhotoCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Layer 1: The Background (Your Camera Preview or a Placeholder Image)
        Image.asset('assets/placeholder_oblation.jpg', fit: BoxFit.cover),

        // Layer 2: The Top "Detect" Pill
        Positioned(
          top: 60, // Adjust for status bar
          left: 0,
          right: 0,
          child: Center(
            child: Container(
            ),
          ),
        ),

        // Layer 3: The Bottom Controls (Flashlight & Capture)
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Flashlight Button
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.flash_on), onPressed: () {  },
              ),

              // That massive Green Capture Button
              GestureDetector(
                onTap: () {
                  // YOUR ROUTING LOGIC GOES HERE
                },
                child: Container(
                  // Green circle with a white border
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
  }
}
