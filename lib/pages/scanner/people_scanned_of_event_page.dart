import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/auth_providers.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';

class PeopleScannedOfEvent extends ConsumerWidget {
  PeopleScannedOfEvent({Key? key, required this.args})
      : super(key: key);

  final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///TODO: get id of current user
    var events = ref.watch(ticketsAtScannedByProvider(ref.read(sessionNotifierProvider).user!.id));

    return events.when(
      data: (var events) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("voor ${args["name"]}",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                      color: Colors.black87,
                      fontWeight:
                          Theme.of(context).textTheme.headline1!.fontWeight)),
              Text(args["date"],
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black38,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2!.fontWeight)),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          events[index].name,
                          style: TextStyle(
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize),
                        ),
                        subtitle: Text(
                          "event: " + events[index].eventId.toString(),
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize,
                              color: Colors.black38,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontWeight),
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
                    onPressed: () async => ref
                        .read(navigationNotifierProvider)
                        .selectPage(4, args),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tickets scannen",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize),
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
                        padding: const EdgeInsets.all(
                            10) //content padding inside button
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
