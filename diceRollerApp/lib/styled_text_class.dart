import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.outputText, {super.key});
  final String outputText;
  @override
  Widget build(context) {
    return Text(
      outputText,
      style:
          const TextStyle(fontSize: 28, color: Color.fromARGB(255, 2, 1, 75)),
    );
  }
}
