import 'package:flutter/material.dart';
import '../authentication/auth_gate.dart';
import './onboarding_service.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double bodyTextSize = 20;
    const double titleTextSize = 30;
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "hi Sudoku",
          body: 'Welcome to the stress-less social app\n',
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Center(
              child: Image.asset('assets/hi_sudoku_logo_no_bg.png'),
            ),
          ),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: titleTextSize,
            ),
            bodyTextStyle:
                TextStyle(color: Colors.white, fontSize: bodyTextSize),
          ),
        ),
        PageViewModel(
          title: "Good to know",
          body: "Have fun solving Sudoku.\nHave fun meeting new people\n",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Center(
              child: Image.asset('assets/hi_sudoku_logo_no_bg.png'),
            ),
          ),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: titleTextSize,
            ),
            bodyTextStyle:
                TextStyle(color: Colors.white, fontSize: bodyTextSize),
          ),
        ),
        PageViewModel(
          title: "Get Started",
          body: "Have fun solving Sudoku.\nHave fun meeting new people\n",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Center(
              child: Image.asset('assets/hi_sudoku_logo_no_bg.png'),
            ),
          ),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: titleTextSize,
            ),
            bodyTextStyle:
                TextStyle(color: Colors.white, fontSize: bodyTextSize),
          ),
        ),
      ],
      onDone: () async {
        await OnboardingService.completeOnboarding();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const AuthGate(),
          ),
        );
      },
      onSkip: () async {
        await OnboardingService.completeOnboarding();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const AuthGate(),
          ),
        );
      },
      skip: const Text('Skip'),
      next: const Text('Next'),
      done: const Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
