import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../utils.dart';

class ChooseEvent extends ConsumerWidget {
  const ChooseEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(allEventsProvider);

    return events.when(
      data: (var events) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: getCorrectHeightFromPercentage(90, context)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 15),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: lightPurple,
                        ), // icon is 48px widget.
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: lightPurple, width: 2),
                        borderRadius: BorderRadius.circular(borderRadiusTheme),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: inputFieldBackgroundColor, width: 0),
                        borderRadius: BorderRadius.circular(borderRadiusTheme),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize,
                          color: lightPurple),
                      labelText: "Search",
                      fillColor: inputFieldBackgroundColor,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field is empty";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
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
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.category),
                                SizedBox(
                                  height: 80,
                                  width: 200,
                                  child: ListTile(
                                    onTap: () {
                                      ref
                                          .read(navigationNotifierProvider)
                                          .selectPage(3, args: {
                                        'name': events[index].name,
                                        'date': events[index]
                                                .startDate
                                                .day
                                                .toString() +
                                            " - " +
                                            DateFormat.MMMM()
                                                .format(events[index].startDate)
                                                .toString() +
                                            " - " +
                                            events[index]
                                                .startDate
                                                .year
                                                .toString(),
                                        "eventId": events[index].id
                                      });
                                      SelectedEventSingleton().selectedEvent = {
                                        'name': events[index].name,
                                        'date': events[index]
                                                .startDate
                                                .day
                                                .toString() +
                                            " - " +
                                            DateFormat.MMMM()
                                                .format(events[index].startDate)
                                                .toString() +
                                            " - " +
                                            events[index]
                                                .startDate
                                                .year
                                                .toString(),
                                        "eventId": events[index].id
                                      };
                                    },
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
                                      events[index].startDate.day.toString() +
                                          " - " +
                                          DateFormat.MMMM()
                                              .format(events[index].startDate)
                                              .toString() +
                                          " - " +
                                          events[index]
                                              .startDate
                                              .year
                                              .toString(),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
      error: (_, __) {
        return Text('Error: $_');
      },
    );
  }
}
