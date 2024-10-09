import 'package:first_app/dice.dart';
import 'package:first_app/expense_manager/expenses.dart';
import 'package:first_app/locations/location_example.dart';
import 'package:first_app/quiz/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  // This code for Start Location Fetching App
  // runApp(
  //   MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(useMaterial3: true),
  //     home: const LocationExample(),
  //   ),
  // );

  // This code for Start Quiz App
  //runApp(const Quiz());

  // This code for Start Dice App
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DiceScreen(
          colors: [
            Color.fromARGB(255, 54, 1, 92),
            Color.fromARGB(255, 102, 0, 145)
          ],
        ),
      ),
    ),
  );
}
