import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/home_page.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({super.key});

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  Future<void> completeOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    // After saving the flag, navigate to HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  List<PageViewModel> pages = [
    PageViewModel(
      title: 'Screen 1',
      body: 'This is a Screen One!',
      image: LottieBuilder.asset('assets/lottie_animation/ani_1.json'),
    ),
    PageViewModel(
      title: 'Screen 2',
      body: 'This is a Screen Two!',
      image: LottieBuilder.asset('assets/lottie_animation/ani_2.json'),
    ),
    PageViewModel(
      title: 'Screen 3',
      body: 'This is a Screen Three!',
      image: LottieBuilder.asset('assets/lottie_animation/ani_3.json'),
    ),
    PageViewModel(
      title: 'Screen 4',
      body: 'This is a Screen Four!',
      image: LottieBuilder.asset('assets/lottie_animation/ani_4.json'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: pages,
          showSkipButton: true,
          skip: const Icon(
            Icons.skip_next,
            color: Colors.black,
            size: 40,
          ),
          next: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.black,
            size: 40,
          ),
          done: const Icon(
            Icons.done,
            color: Colors.black,
            size: 40,
          ),
          onDone: () {
            completeOnboarding(context); // Call to mark onboarding as done
          },
          bodyPadding: const EdgeInsets.only(top: 120),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blueGrey,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
