import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';

class HistoryOfTicketsMade extends ConsumerWidget {
  const HistoryOfTicketsMade({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(ticketsAtCreatedByProvider).tickets;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("Scanned tickets",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                  color: Colors.black87,
                  fontWeight:
                  Theme.of(context).textTheme.headline1!.fontWeight)),

          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      events[index].name,
                      style: TextStyle(
                          fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                          fontSize:
                          Theme.of(context).textTheme.headline2!.fontSize),
                    ),
                    subtitle: Text(
                      "event: " + events[index].eventId.toString(),
                      style: TextStyle(
                          fontSize:
                          Theme.of(context).textTheme.bodyText2!.fontSize,
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tickets aanmaken",
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
  }
}
