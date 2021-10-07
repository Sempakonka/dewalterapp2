import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseEvent extends ConsumerWidget {
  const ChooseEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(eventsProvider);

    return events.when(
      data: (var events) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    events[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  subtitle: Text(
                 "voor "  + events[index].startDate.year.toString(),
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: (AsyncValue<List<Event>>? previous) {
        return const Padding(
          padding: EdgeInsets.all(168.0),
          child: CircularProgressIndicator(),
        );
      },
      error: (Object error, StackTrace? stackTrace,
          AsyncData<List<Event>>? previous) {
        return Text('Error: $previous');
      },
    );
  }
}
