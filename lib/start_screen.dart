import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Learn flutter the fun way',
            style: GoogleFonts.jacquardaBastarda9(
              color: Colors.white,
              fontSize: 26,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: changeScreen,
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
                side: BorderSide(color: Colors.purple.shade900)),
            label: const Text(
              'Start quiz',
            ),
          ),
        ],
      ),
    );
  }
}
