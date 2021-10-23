import 'package:de_walter_app_2/pages/scanner/incorrect_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/valid_ticked.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'database_service.dart';

// checks if code is valid
Future<bool> checkCode(String code, int eventId) async {
  bool resultOfCheckQrIDExistence;
  bool isAlreadyScanned;

  if (await checkQrIDExistence(code) == 1) {
    resultOfCheckQrIDExistence = true;

    if (resultOfCheckQrIDExistence) {
      isAlreadyScanned = await checkIfAlreadyScanned(code);

      if (!isAlreadyScanned) {
        var res = await checkSelectedEventIsEqualToTicketEvent(code);
        if (res == eventId) {
          return true;
        }
      }
    }
  } else {
    return false;
  }

  return false;
}

void handleScannedCode(String code, QRViewController controller,
    BuildContext context, int eventId) async {
  controller.pauseCamera();

  bool isValidCode = await checkCode(code, eventId);

  isValidCode
      ? await Navigator.pushNamed(context, ValidTicket.routeName)
      : await Navigator.pushNamed(context, IncorrectTicket.routeName);
}
