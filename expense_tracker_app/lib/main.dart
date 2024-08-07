import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

ColorScheme kMyColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 250, 250, 250));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
      colorScheme: kMyColorScheme,
      primaryColor: const Color.fromARGB(255, 237, 201, 94),
      appBarTheme: AppBarTheme(
        backgroundColor: kMyColorScheme.onSecondary,
        foregroundColor: Colors.black,
      ),
      cardTheme: CardTheme(
        color: kMyColorScheme.secondary,
        margin: const EdgeInsets.all(16),
      ),
    ),
    home: const Expenses(),
  ));
  // });
}
