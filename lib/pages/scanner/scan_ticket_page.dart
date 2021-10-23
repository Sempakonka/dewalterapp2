import 'package:de_walter_app_2/services/qr_scanner_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../globals.dart';
import '../navigation.dart';

class ScanTicketPage extends ConsumerWidget {
  const ScanTicketPage({Key? key, required this.args}) : super(key: key);

  final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text("voor ${args["name"]}",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                color: Colors.black87,
                fontWeight: Theme.of(context).textTheme.headline1!.fontWeight)),
        Text(args["date"],
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                color: Colors.black38,
                fontWeight: Theme.of(context).textTheme.bodyText2!.fontWeight)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(45.0, 40, 45, 40),
            child: QRView(
              overlay: QrScannerOverlayShape(
                  borderLength: 30, borderColor: Colors.green),
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: (controller) => {
                controller.scannedDataStream.listen((scanData) {
                  handleScannedCode(
                      scanData.code, controller, context, args["eventId"]);
                })
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton(
              onPressed: () async =>
                  ref.read(navigationNotifierProvider).selectPage(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alle evenementen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText2!.fontSize),
                  ),
                  const Icon(Icons.arrow_downward_rounded)
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: green,
                  //background color of button
                  //elevation of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      const EdgeInsets.all(10) //content padding inside button
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
