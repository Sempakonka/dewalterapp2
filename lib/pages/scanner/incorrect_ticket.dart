import 'package:de_walter_app_2/services/qr_scanner_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncorrectTicket extends ConsumerWidget {
  static const routeName = '/incorrectTicket';

  const IncorrectTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketResultArgs = ModalRoute.of(context)!.settings.arguments as TicketResultArgs;
    final controller = ticketResultArgs.controller;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.clear_rounded,
                size: 170,
                color: Colors.white,
              ),
              const Text(
                "Ongeldige QR code",
                style: TextStyle(color: Colors.white,fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 35),
                child: ElevatedButton(
                 onPressed: () { Navigator.pop(context); controller.resumeCamera();},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Opnieuw scannen",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .fontSize),
                      ),
                      const Icon(Icons.arrow_forward_outlined,
                          color: Colors.red),
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
    );
  }
}
