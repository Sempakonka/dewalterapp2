import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../../utils.dart';

class IncorrectTicket extends ConsumerWidget {
  static const routeName = '/incorrectTicket';

  const IncorrectTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(80, context)),
      child: Container(
        decoration: const BoxDecoration(
          color: red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 40, 30, 25),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          "Invalid QR Code",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: SizedBox(
                            width: 74,
                            height: 74,
                            child: Image.asset('assets/QrImage.png'),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: greenTransparent,
                          borderRadius: BorderRadius.circular(borderRadiusTheme),
                          border: Border.all(color: inputFieldBackgroundColorBorder),
                        ),
                      ),
                    ],
                  ),
                ),
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
                              color: red),
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
        ),
      ),
    );
  }
}
