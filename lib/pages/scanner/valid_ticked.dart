import 'package:de_walter_app_2/pages/scanner/already_scanned_ticket.dart';
import 'package:de_walter_app_2/providers/auth_providers.dart';
import 'package:de_walter_app_2/services/database_service.dart';
import 'package:de_walter_app_2/services/qr_scanner_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';

class ValidTicket extends ConsumerWidget {
  static const routeName = '/validTicket';

  const ValidTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketResultArgs =
        ModalRoute.of(context)!.settings.arguments as TicketResultArgs;
    final scannedTicket = ticketResultArgs.ticket;
    final controller = ticketResultArgs.controller;


    return MaterialApp(
      home: Scaffold(
        backgroundColor: green,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.check_rounded,
                  size: 170,
                  color: Colors.white,
                ),
                const Text(
                  "Geldige QR code",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.start,
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
                        "Ticket prijs",
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
                    style: const TextStyle(color: green),
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
                        "Nog te betalen",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    (scannedTicket.ticketPrice! - scannedTicket.prePayment!)
                        .toString(),
                    style: const TextStyle(color: green),
                  )),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 5),
                  child: ElevatedButton(
                    onPressed: () async {
                      bool isScanned =
                          await checkIfAlreadyScanned(scannedTicket.tickedCode);
                      if (!isScanned) {
                        checkInTicket(scannedTicket.tickedCode, DateTime.now(),
                            ref.watch(sessionNotifierProvider).user!.id);
                        controller.resumeCamera();
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AlreadyScanned.routeName,
                            arguments: TicketResultArgs(
                                ticket: scannedTicket, controller: controller));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Accepteer",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize),
                        ),
                        const Icon(Icons.arrow_forward_outlined, color: green),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        //background color of button
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(
                            10) //content padding inside button
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 35),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controller.resumeCamera();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back_outlined,
                            color: Colors.red),
                        Text(
                          "Annuleer",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        //background color of button
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
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
