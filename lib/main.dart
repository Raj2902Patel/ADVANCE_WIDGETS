import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/home_page.dart';
import 'package:week_4/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool _seenOnboarding = false;

  Future<bool> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seenOnboarding') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Custom',
      ),
      home: FutureBuilder<bool>(
        future: checkOnboardingStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data == true) {
            return FutureBuilder(
              future: Future.delayed(const Duration(seconds: 4)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const HomePage();
                } else {
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
              },
            );
          } else {
            return const LoadingScreen();
          }
        },
      ),
    );
  }
}

// Raj Patel
