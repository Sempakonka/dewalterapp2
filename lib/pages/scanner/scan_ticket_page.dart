import 'package:de_walter_app_2/services/qr_scanner_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../globals.dart';
import '../../utils.dart';

class ScanTicketPage extends ConsumerWidget {
  const ScanTicketPage({Key? key, required this.args}) : super(key: key);

  final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(80, context)),
      child: Stack(
        children: [
          /* Text("voor ${args["name"]}",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                  color: Colors.black87,
                  fontWeight: Theme.of(context).textTheme.headline1!.fontWeight)),
          Text(args["date"],
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                  color: Colors.black38,
                  fontWeight: Theme.of(context).textTheme.bodyText2!.fontWeight)),*/
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            child: SizedBox(
              height: getCorrectHeightFromPercentage(100, context),
              child: QRView(
                overlay: QrScannerOverlayShape(
                    borderRadius: 40,
                    borderLength: 30,
                    borderColor: Colors.white),
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
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: eventIdentifier(context, args),
            ),
          ),
        ],
      ),
    );
  }

  eventIdentifier(BuildContext context, final args) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 28, 18, 18),
        child: Container(
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
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        args["name"],
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(args["date"],
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: inputFieldBackgroundColor,
              borderRadius: BorderRadius.circular(borderRadiusTheme),
              border: Border.all(color: inputFieldBackgroundColorBorder)),
        ),
      ),
    );
  }
}
