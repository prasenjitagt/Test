import "package:flutter/material.dart";
import "./my_first_class.dart";

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        body: MyFirstClass([
      Color.fromARGB(255, 56, 215, 240),
      Color.fromARGB(255, 31, 75, 219)
    ])),
  ));
}
