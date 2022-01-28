import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const green = Color.fromARGB(255, 16, 172, 132);
const darkBlue = Color.fromARGB(255, 27, 20, 100);
const lightTextBlue = Color.fromARGB(255, 128, 123, 174);
const inputFieldBackgroundColor = Color.fromARGB(255, 241, 240, 250);
const lightPurple = Color.fromARGB(255, 108, 92, 231);
const inputFieldBackgroundColorBorder = Color.fromARGB(255, 231, 229, 244);
const borderRadiusTheme = 12.0;


final darkButton = ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 27, 20, 100),
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusTheme)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);

final lightButton = ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 108, 92, 231),
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusTheme)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);


class SelectedEventSingleton {
  static final SelectedEventSingleton _instance = SelectedEventSingleton._internal();

  factory SelectedEventSingleton() => _instance;

  Map? selectedEvent;

  SelectedEventSingleton._internal();
}

