import 'package:de_walter_app_2/pages/scanner/incorrect_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/valid_ticked.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'database_service.dart';

void onQRViewCreated(QRViewController controller) {
  controller.scannedDataStream.listen((scanData) {
    handleScannedCode(scanData.code, controller, context);
  });
}

// checks if code is valid
Future<bool> checkCode(String code) async {
  bool resultOfCheckQrIDExistence;
  bool isAlreadyScanned;

  if (await checkQrIDExistence(code) == 1) {
    resultOfCheckQrIDExistence = true;

    if (resultOfCheckQrIDExistence) {
      isAlreadyScanned = await checkIfAlreadyScanned(code);

      if (!isAlreadyScanned) {
        var res = await checkSelectedEventIsEqualToTicketEvent(code);
        if (res == /*selectedEvent*/ 0) {
          return true;
        }
      }
    }
  } else {
    return false;
  }

  return false;
}

void handleScannedCode(
    String code, QRViewController controller, BuildContext context) async {
  controller.pauseCamera();

  bool isValidCode = await checkCode(code);

  isValidCode
      ? await Navigator.pushNamed(context, ValidTicket.routeName)
      : await Navigator.pushNamed(context, IncorrectTicket.routeName);
}
