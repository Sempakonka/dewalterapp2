import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../globals.dart';
import '../../utils.dart';

class QrAwaitPayment extends ConsumerWidget {
  const QrAwaitPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(90, context)),
      child: Column(
        children: [
          eventIdentifier(context),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: inputFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(borderRadiusTheme),
                    border: Border.all(color: inputFieldBackgroundColorBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: QrImage(
                        foregroundColor: darkBlue,
                        data: "12345678gvbrtgrtgtr90",
                        version: QrVersions.auto,
                        size: 300.0,
                        embeddedImage: const AssetImage('assets/TickventLogo.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size(120, 120),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: lightPurple.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8,20,0,0),
            child: SpinKitSpinningLines(
              color: lightPurple,
              size: 60.0,
            )
          )
              ],
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.category),
            Expanded(
              child: ListTile(
                title: Text(
                  "name",
                  style: TextStyle(
                      fontWeight:
                      Theme.of(context).textTheme.headline2!.fontWeight,
                      fontSize:
                      Theme.of(context).textTheme.headline2!.fontSize),
                ),
                subtitle: Text(
                  "mail",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black38,
                      fontWeight:
                      Theme.of(context).textTheme.bodyText2!.fontWeight),
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
      ),
    );
  }
}
