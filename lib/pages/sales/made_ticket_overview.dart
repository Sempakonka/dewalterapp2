import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../../utils.dart';
import '../navigation.dart';

class MadeTicketOverview extends ConsumerWidget {
  const MadeTicketOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(90, context)),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                eventIdentifier(context),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: ElevatedButton(
              onPressed: () {
                ref.read(navigationNotifierProvider).selectPage(6);
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                  child: Text(
                    "Back To The Overview",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.bodyText2?.fontWeight,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2?.fontFamily,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              style: darkButton,
            ),
          ),
        ],
      ),
    );
  }

  eventIdentifier(BuildContext context) {
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
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.category),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Ramanda Event",
                      style: TextStyle(
                          fontWeight:
                              Theme.of(context).textTheme.headline2!.fontWeight,
                          fontSize:
                              Theme.of(context).textTheme.headline2!.fontSize),
                    ),
                    subtitle: Text(
                      "24-11-2000",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize,
                          color: Colors.black38,
                          fontWeight: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .fontWeight),
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
            informationContainer(context)
          ],
        ),
      ),
    );
  }
}

informationContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 15.0),
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
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2?.fontWeight,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText2?.fontFamily,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 0, 8),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2?.fontWeight,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText2?.fontFamily,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 0, 8),
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2?.fontWeight,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText2?.fontFamily,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 0, 16),
                child: Text(
                  "Scanned At",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2?.fontWeight,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText2?.fontFamily,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 14, 8),
                child: Text("Sem Pakonka",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight: FontWeight.w800,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2?.fontFamily,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 14, 8),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: AutoSizeText(
                    "sempakonka@g...",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight: FontWeight.w800,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2?.fontFamily,
                        color: Colors.white),
                  ),
                ),
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
                        color: Colors.white)),
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
                        color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.circular(borderRadiusTheme),
        border: Border.all(color: lightPurple),
      ),
    ),
  );
}
