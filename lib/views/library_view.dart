import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget{
  const LibraryView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color(0xFFF0F0F0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ('lib/views/assets/logo.png'),
                fit: BoxFit.contain,
                height: 32,
              ),
            ],
          ),
        )
    );
  }
}

