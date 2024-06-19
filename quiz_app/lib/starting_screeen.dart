import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen(this.changeToQusScreen, {super.key});

  final void Function() changeToQusScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(141, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the Fun Way!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: changeToQusScreen,
              icon: const Icon(
                Icons.arrow_right_alt_rounded,
              ),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text("Start quiz"))
        ],
      ),
    );
  }
}
