import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Text(
          "Favourite Page",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
