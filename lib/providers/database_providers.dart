import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/services/database_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsNotifierProvider = ChangeNotifierProvider((ref) => EventsNotifier());

class EventsNotifier extends ChangeNotifier{
  List<Event>? _events;

  List<Event>? get events => _events;

  void getEvents() async {
    _events = await getAllActiveEvents();
  }
}

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final content = await getAllActiveEvents();
  return content;
});