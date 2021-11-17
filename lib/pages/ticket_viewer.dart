import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'navigation.dart';

class TicketViewer extends ConsumerWidget {
  const TicketViewer({Key? key, required this.args}) : super(key: key);

  final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScanned = ref.watch(isScannedProvider(args.tickedCode));
    final eventData = ref.watch(eventAtIdProvider(args.eventId));
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: Text(
            "Ticket holder",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: 'Naam: '),
                TextSpan(
                    text: args.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: 'E-mail: '),
                TextSpan(
                    text: args.email,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: Text(
            "Event",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: 'Event: '),
                TextSpan(
                    text: eventData.value!.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                const TextSpan(text: 'Datum: '),
                TextSpan(
                    text: DateFormat('yyyy-MM-dd')
                        .format(eventData.value!.startDate),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: Text(
            "Ticket",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: 'Scanned: '),
                TextSpan(
                    text: isScanned.value ? "Yes" : "No",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: 'Pre payment: '),
                TextSpan(
                    text: "€ ${args.prePayment.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: 'Price: '),
                TextSpan(
                    text: "€ ${args.ticketPrice}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  color: Colors.black54),
              children: <TextSpan>[
                const TextSpan(text: 'Ticket created at: '),
                TextSpan(
                    text: DateFormat('yyyy-MM-dd').format(args.createdAt),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: Text(
            "To be payed",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                color: args.status == 0 ? Colors.redAccent : green),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
          child: Container(
            height: 50,
            width: double.infinity,
            child: Center(
                child: Text(
              args.status == 0
                  ? "€ ${(args.ticketPrice - args.prePayment).toString()}"
                  : "€ 0",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                  color: Colors.white),
            )),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: args.status == 0 ? Colors.redAccent : green),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: ElevatedButton(
            onPressed: () => ref.watch(navigationNotifierProvider).pop(
                context: context, args: SelectedEventSingleton().selectedEvent),
            child: const Text("Terug naar overzicht"),
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
        )
      ],
    );
  }
}
