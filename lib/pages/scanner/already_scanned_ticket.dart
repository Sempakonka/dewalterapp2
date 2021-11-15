import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/services/qr_scanner_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';

class AlreadyScanned extends ConsumerWidget {
  const AlreadyScanned({Key? key}) : super(key: key);

  static const routeName = '/alreadyScannedTicket';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketResultArgs = ModalRoute.of(context)!.settings.arguments as TicketResultArgs;
    final scannedTicket = ticketResultArgs.ticket;
    final controller = ticketResultArgs.controller;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.flag,
                  size: 170,
                  color: Colors.white,
                ),
                const Text(
                  "Ticket already scanned",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Naam",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      scannedTicket!.name,
                      style: TextStyle(color: green),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 18, 0, 5),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "E-mail",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    scannedTicket.email,
                    style: TextStyle(color: green),
                  )),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 18, 0, 5),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Scanned By",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    scannedTicket.scannedBy.toString(),
                    style: TextStyle(color: green),
                  )),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 18, 0, 5),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Date scanned",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    scannedTicket.scannedAt.toString(),
                    style: const TextStyle(color: green),
                  )),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 35, 50, 35),
                  child: ElevatedButton(
                    onPressed: () { Navigator.pop(context); controller.resumeCamera();},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Verder met scannen ",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize),
                        ),
                        const Icon(Icons.arrow_forward_rounded,
                            color: Colors.red),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        //background color of button
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        padding: const EdgeInsets.all(
                            10) //content padding inside button
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
