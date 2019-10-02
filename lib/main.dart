import 'package:flutter/material.dart';
import 'Screens/ChooseScreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'TesteApp',
    home: ChooseScreen(),
    theme: ThemeData(
        hintColor: Colors.yellow,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.yellow)))),
  ));
}
