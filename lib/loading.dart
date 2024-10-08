import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:week_4/intro_slider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds before navigating to the home screen
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroSliderPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.threeArchedCircle(
              color: Colors.blueGrey,
              size: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Loading...",
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
                TyperAnimatedText(
                  "Loading...",
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
                TyperAnimatedText(
                  "Loading...",
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
              ],
              isRepeatingAnimation: true,
              // totalRepeatCount: 1000,
              repeatForever: true,
            ),
          ],
        ),
      ),
    );
  }
}
