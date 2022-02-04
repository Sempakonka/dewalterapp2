import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const green = Color.fromARGB(255, 0, 206, 132);
const greenTransparent = Color.fromARGB(25, 255, 255, 255);
const darkBlue = Color.fromARGB(255, 27, 20, 100);
const lightTextBlue = Color.fromARGB(255, 128, 123, 174);
const inputFieldBackgroundColor = Color.fromARGB(255, 241, 240, 250);
const lightPurple = Color.fromARGB(255, 108, 92, 231);
const inputFieldBackgroundColorBorder = Color.fromARGB(255, 231, 229, 244);
const red = Color.fromARGB(255, 237,59, 59);
const redTransparent = Color.fromARGB(25, 255, 255, 255);
const yellow = Color.fromARGB(255, 255, 191, 71);
const yellowTransparant =Color.fromARGB(25, 255, 255, 255);
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

final whiteButton = ElevatedButton.styleFrom(
    primary: Colors.white,
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusTheme)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);

final greenButton = ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 0, 206, 132),
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

