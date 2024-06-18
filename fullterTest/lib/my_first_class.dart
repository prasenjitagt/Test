import 'package:flutter/material.dart';
import './styled_text_class.dart';

class MyFirstClass extends StatelessWidget {
  const MyFirstClass({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 56, 215, 240),
        Color.fromARGB(255, 31, 75, 219)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
