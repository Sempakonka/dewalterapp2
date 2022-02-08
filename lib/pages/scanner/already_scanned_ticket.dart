import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/services/qr_scanner_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../../utils.dart';

class AlreadyScanned extends ConsumerWidget {
  const AlreadyScanned({Key? key}) : super(key: key);

  static const routeName = '/alreadyScannedTicket';


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(80, context)),
      child: Container(
        decoration: const BoxDecoration(color: yellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 40, 30, 25),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,20),
                  child: Text(
                    "Already scanned QR Code",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 16, 0, 8),
                            child: Text(
                              "Scanned at",
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.fontSize,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.fontFamily,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 8, 0, 16),
                            child: Text(
                              "Scanned by",
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.fontSize,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.fontFamily,
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
                            child: Text("24-11-2000",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.fontSize,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.fontFamily,
                                    color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 14, 16),
                            child: Text("Sempakonka@gmail.com",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.fontSize,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.fontFamily,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: yellowTransparent,
                    borderRadius: BorderRadius.circular(borderRadiusTheme),
                    border: Border.all(color: inputFieldBackgroundColorBorder),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                              child: Text(
                                "Accept",
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
                                    color: yellow),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          style: whiteButton,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
