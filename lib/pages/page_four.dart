import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Text(
          "Setting Page",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}