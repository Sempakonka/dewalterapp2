import 'package:flutter/cupertino.dart';

const green = Color.fromARGB(255, 16, 172, 132);

class SelectedEventSingleton {
  static final SelectedEventSingleton _instance = SelectedEventSingleton._internal();

  factory SelectedEventSingleton() => _instance;

  Map? selectedEvent;

  SelectedEventSingleton._internal();
}

