import 'package:flutter/material.dart';

enum ColorCategory { primaryColor, secondaryColor }

const Map<ColorCategory, Color> myColor = {
  ColorCategory.primaryColor: Color.fromARGB(255, 214, 199, 154),
  ColorCategory.secondaryColor: Color.fromARGB(255, 141, 235, 144)
};
