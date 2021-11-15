import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/pages/scanner/already_scanned_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/incorrect_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/valid_ticked.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'database_service.dart';

// checks if code is valid
Future<String> checkCode(String code, int eventId) async {
  bool resultOfCheckQrIDExistence;
  bool isAlreadyScanned;

  if (await checkQrIDExistence(code) == 1) {
    resultOfCheckQrIDExistence = true;

    if (resultOfCheckQrIDExistence) {
      isAlreadyScanned = await checkIfAlreadyScanned(code);

      if (!isAlreadyScanned) {
        var res = await checkSelectedEventIsEqualToTicketEvent(code);
        if (res == eventId) {
          return "CORRECT";
        }
      } else {
        return "ALREADY_SCANNED";
      }
    }
  } else {
    return "INCORRECT";
  }

  return "INCORRECT";
}

void handleScannedCode(String code, QRViewController controller,
    BuildContext context, int eventId) async {
  controller.pauseCamera();

  String isValidCode = await checkCode(code, eventId);
  Ticket? scannedTicket = await getTicketByCode(code);

  switch (isValidCode) {
    case "CORRECT":
      await Navigator.pushNamed(context, ValidTicket.routeName,
          arguments:
              TicketResultArgs(ticket: scannedTicket, controller: controller));
      break;
    case "ALREADY_SCANNED":
      await Navigator.pushNamed(context, AlreadyScanned.routeName,
          arguments:
              TicketResultArgs(ticket: scannedTicket, controller: controller));
      break;
    case "INCORRECT":
      await Navigator.pushNamed(context, IncorrectTicket.routeName,
          arguments: TicketResultArgs(controller: controller));
  }
}

class TicketResultArgs {
  TicketResultArgs({this.ticket, required this.controller});

  Ticket? ticket;
  QRViewController controller;
}
