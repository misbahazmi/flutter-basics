import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key, required this.colors});
  final List<Color> colors;
  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  var topLeftAlignment = Alignment.topLeft;
  var bottomRightAlignment = Alignment.bottomRight;

  var currentDicePos = 1;
  Random randomIndex = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        gradient: LinearGradient(
            colors: widget.colors,
            begin: topLeftAlignment,
            end: bottomRightAlignment),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dice_$currentDicePos.png',
              width: 100,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }

  void rollDice() {
    setState(() {
      currentDicePos = randomIndex.nextInt(6) + 1;
    });
  }
}
