import 'package:first_app/dice.dart';
import 'package:first_app/expense_manager/expenses.dart';
import 'package:first_app/locations/location_example.dart';
import 'package:first_app/quiz/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const LocationExample(),
    ),
  );

  //runApp(const Quiz());

  // runApp(const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       body:
  //           //Start the Quiz App
  //           Quiz(),

  //       //Start the Dice App

  //       // DiceScreen(
  //       //   colors: [
  //       //     Color.fromARGB(255, 54, 1, 92),
  //       //     Color.fromARGB(255, 102, 0, 145)
  //       //   ],
  //       // ),
  //     ),
  //   ),
  // );
}
