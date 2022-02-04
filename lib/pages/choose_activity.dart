import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ChooseActivity extends HookConsumerWidget {
  final Duration duration = const Duration(milliseconds: 400);

  const ChooseActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(allEventsProvider);

    return events.when(
      data: (var events) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Continuing with workspace",
                    style: Theme.of(context).textTheme.headline1,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Icon(Icons.email),
                      ),
                      Text("Square",
                          style: Theme.of(context).textTheme.headline2)
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(borderRadiusTheme),
                    boxShadow: [
                      BoxShadow(
                        color: lightPurple.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Enter your workspace",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: ElevatedButton(
                  onPressed: () =>
                      ref.read(navigationNotifierProvider).selectPage(1),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Scanner",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText2?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontWeight,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontFamily,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  style: darkButton,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(navigationNotifierProvider).selectPage(6, args: {
                        'name': events[0].name,
                        'date': events[0].startDate.day.toString() +
                            " - " +
                            DateFormat.MMMM()
                                .format(events[0].startDate)
                                .toString() +
                            " - " +
                            events[0].startDate.year.toString(),
                        "eventId": events[0].id
                      });
                      SelectedEventSingleton().selectedEvent = {
                        'name': events[0].name,
                        'date': events[0].startDate.day.toString() +
                            " - " +
                            DateFormat.MMMM()
                                .format(events[0].startDate)
                                .toString() +
                            " - " +
                            events[0].startDate.year.toString(),
                        "eventId": events[0].id
                      };
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child: Text(
                          "Seller",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.fontWeight,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.fontFamily,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    style: lightButton),
              ),
            ],
          ),
        );
      },
      loading: () {
        return const Padding(
          padding: EdgeInsets.all(168.0),
          child: CircularProgressIndicator(),
        );
      },
      error: (_, __) {
        return Text('Error: $_');
      },
    );
  }
}
