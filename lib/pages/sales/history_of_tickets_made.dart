import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../../utils.dart';

class HistoryOfTicketsMade extends ConsumerWidget {
  const HistoryOfTicketsMade({Key? key, required this.args}) : super(key: key);

 final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(ticketsAtScannedByProvider).tickets;

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(90, context)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 18),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0,8,0,8),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: lightPurple,
                              borderRadius: BorderRadius.circular(borderRadiusTheme),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(14,14,14,14),
                                  child: Image(image: AssetImage('assets/ticketIcon.png')
                             ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 200,
                              child: ListTile(
                                onTap: () => ref
                                    .read(navigationNotifierProvider)
                                    .selectPage(13, args: events[index]),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 18),
              child: ElevatedButton(
                  onPressed: () async => ref
                      .read(navigationNotifierProvider)
                      .selectPage(12),
                  child:
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Make Ticket",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .fontSize),
                      ),
                    ),
                  ),
                  style: darkButton
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ticketItem(BuildContext context){
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              Icons.email,
              size: 50,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(

              children: [
                SizedBox(
                  ///TODO: The width is hardcoded. This should not be hardcoded
                  width: 200,
                  child: Text(
                    args["name"],
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(args["date"],
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: inputFieldBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadiusTheme),
          border: Border.all(color: inputFieldBackgroundColorBorder)),
    );
  }
}
