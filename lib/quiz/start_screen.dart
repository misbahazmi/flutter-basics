import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuizScreen});

  final void Function() startQuizScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(255, 237, 223, 252),
          ),
          const SizedBox(height: 50),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuizScreen,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 237, 223, 252),
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 223, 252),
              ),
            ),
          )
        ],
      ),
    );
  }
}
