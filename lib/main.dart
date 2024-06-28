import 'package:first_app/dice.dart';
import 'package:flutter/material.dart';

void main() {
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
