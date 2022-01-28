import 'package:flutter/cupertino.dart';

const green = Color.fromARGB(255, 16, 172, 132);
const darkBlue = Color.fromARGB(255, 27, 20, 100);
const lightTextBlue = Color.fromARGB(255, 128, 123, 174);
const inputFieldBackgroundColor = Color.fromARGB(255, 241, 240, 250);
const lightPurple = Color.fromARGB(255, 108, 92, 231);


class SelectedEventSingleton {
  static final SelectedEventSingleton _instance = SelectedEventSingleton._internal();

  factory SelectedEventSingleton() => _instance;

  Map? selectedEvent;

  SelectedEventSingleton._internal();
}

