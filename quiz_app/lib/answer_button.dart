import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.buttonFunction});

  final String answerText;
  final void Function() buttonFunction;

  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 46, 1, 54),
            foregroundColor: Colors.white),
        onPressed: buttonFunction,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
