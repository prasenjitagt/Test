import 'package:dice_roller_app/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller_app/styled_text_class.dart';

class MyFirstClass extends StatelessWidget {
  const MyFirstClass(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: const Center(
          // child: StyledText("Okay"),
          child: DiceRoller()),
    );
  }
}
