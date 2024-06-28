import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.colors});

  final List<Color> colors;

  var topLeftAlignment = Alignment.topLeft;
  var bottomRightAlignment = Alignment.bottomRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        gradient: LinearGradient(
            colors: colors, begin: topLeftAlignment, end: bottomRightAlignment),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dice_1.png',
              width: 100,
            ),
            const SizedBox(
              height: 40,
            ),
            const ElevatedButton(
              onPressed: rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}

void rollDice() {}
