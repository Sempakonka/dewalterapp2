import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../globals.dart';

class PeopleScannedOfEvent extends ConsumerWidget {
  const PeopleScannedOfEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///TODO: get id of current user
    var events = ref.watch(ticketsAtScannedByProvider(6));

    return events.when(
      data: (var events) {
        print(events[0]);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("voor Players", style: TextStyle(fontSize: Theme.of(context).textTheme.headline1!.fontSize, color: Colors.black87, fontWeight: Theme.of(context).textTheme.headline1!.fontWeight)),
              Text("20- Juli - 2021", style: TextStyle(fontSize: Theme.of(context).textTheme.bodyText2!.fontSize, color: Colors.black38, fontWeight: Theme.of(context).textTheme.bodyText2!.fontWeight)),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: ()=> ref.read(navigationNotifierProvider).selectPage(3),
                        title: Text(
                          events[index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        subtitle: Text(
                       "event: " +  events[index].eventId.toString(),
                          style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async => ref.read(navigationNotifierProvider).selectPage(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tickets scannen",
                          style: TextStyle(
                              fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize),
                        ),
                        const Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: green,
                        //background color of button
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding:
                        const EdgeInsets.all(10) //content padding inside button
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: (AsyncValue<List<Ticket>>? previous) {
        return const Padding(
          padding: EdgeInsets.all(168.0),
          child: CircularProgressIndicator(),
        );
      },
      error: (Object error, StackTrace? stackTrace,
          AsyncData<List<Ticket>>? previous) {
        return Text('Error: $previous');
      },
    );
  }
}
