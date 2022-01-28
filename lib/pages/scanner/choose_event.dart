import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChooseEvent extends ConsumerWidget {
  const ChooseEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(allEventsProvider);

    return events.when(
      data: (var events) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    ref.read(navigationNotifierProvider).selectPage(3, args: {
                      'name': events[index].name,
                      'date': events[index].startDate.day.toString() +
                          " - " +
                          DateFormat.MMMM()
                              .format(events[index].startDate)
                              .toString() +
                          " - " +
                          events[index].startDate.year.toString(),
                      "eventId": events[index].id
                    });
                    SelectedEventSingleton().selectedEvent = {
                      'name': events[index].name,
                      'date': events[index].startDate.day.toString() +
                          " - " +
                          DateFormat.MMMM()
                              .format(events[index].startDate)
                              .toString() +
                          " - " +
                          events[index].startDate.year.toString(),
                      "eventId": events[index].id
                    };
                  },
                  //    onTap: ()=> checkInTicket("67a6ab68-63a2-417a-8dca-16828eb41f72", DateTime(2020), 6),
                  title: Text(
                    events[index].name,
                    style: TextStyle(
                        fontWeight:
                            Theme.of(context).textTheme.headline2!.fontWeight,
                        fontSize:
                            Theme.of(context).textTheme.headline2!.fontSize),
                  ),
                  subtitle: Text(
                    events[index].startDate.day.toString() +
                        " - " +
                        DateFormat.MMMM()
                            .format(events[index].startDate)
                            .toString() +
                        " - " +
                        events[index].startDate.year.toString(),
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText2!.fontSize,
                        color: Colors.black38,
                        fontWeight:
                            Theme.of(context).textTheme.bodyText2!.fontWeight),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () {
        return const Padding(
          padding: EdgeInsets.all(168.0),
          child: CircularProgressIndicator(),
        );
      },
      error: (_,__) {
        return Text('Error: $_');
      },
    );
  }
}
