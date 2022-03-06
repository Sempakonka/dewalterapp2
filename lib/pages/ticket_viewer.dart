import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils.dart';
import 'navigation.dart';

class TicketViewer extends ConsumerWidget {
  const TicketViewer({Key? key, required this.args}) : super(key: key);

  final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScanned = ref.watch(isScannedProvider(args.tickedCode));
    final eventData = ref.watch(eventAtIdProvider(args.eventId));
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(90, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          eventIdentifier(context, eventData),
          informationContainer(context, args),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                  child: ElevatedButton(
                      onPressed: () => ref
                          .watch(navigationNotifierProvider)
                          .pop(
                              context: context,
                              args: SelectedEventSingleton().selectedEvent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Text(
                            "FULLY PAID",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .fontSize),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: green,
                          //background color of button
                          //elevation of button
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(borderRadiusTheme)),
                          padding: const EdgeInsets.all(
                              10) //content padding inside button
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 18),
                  child: ElevatedButton(
                      onPressed: () => ref
                          .watch(navigationNotifierProvider)
                          .pop(
                              context: context,
                              args: SelectedEventSingleton().selectedEvent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .fontSize),
                          ),
                        ),
                      ),
                      style: darkButton),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  informationContainer(BuildContext context, final args) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 16, 0, 8),
                  child: Text(
                    "Name",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 0, 8),
                  child: Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 0, 8),
                  child: Text(
                    "Phone Number",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 0, 16),
                  child: Text(
                    "Scanned At",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 14, 8),
                  child: Text(args.name,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                          fontWeight: FontWeight.w800,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                          color: darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 14, 8),
                  child: Text(args.email,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                          fontWeight: FontWeight.w800,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                          color: darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 14, 8),
                  child: Text("06 403 260 27",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                          fontWeight: FontWeight.w800,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                          color: darkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 14, 16),
                  child: Text("24 - 11 - 2000",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                          fontWeight: FontWeight.w800,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                          color: darkBlue)),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: inputFieldBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadiusTheme),
          border: Border.all(color: inputFieldBackgroundColorBorder),
        ),
      ),
    );
  }

  eventIdentifier(BuildContext context, final eventData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: lightPurple.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.category),
            Expanded(
              child: ListTile(
                title: Text(
                  eventData.value!.name,
                  style: TextStyle(
                      fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                      fontSize:
                          Theme.of(context).textTheme.headline2!.fontSize),
                ),
                subtitle: Text(
                  eventData.value!.startDate.toString(),
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black38,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2!.fontWeight),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: SizedBox(
                width: 34,
                height: 34,
                child: Image.asset('assets/Scan_Grey.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
