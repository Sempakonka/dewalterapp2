import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../../utils.dart';
import '../navigation.dart';

class PrePayment extends ConsumerWidget {
  const PrePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getCorrectHeightFromPercentage(90, context)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                    child: Text("Pre Payment",
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text("49,99",
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.fontSize,
                                  fontWeight: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.fontWeight,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.fontFamily,
                                  color: lightPurple)),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: inputFieldBackgroundColor,
                      borderRadius: BorderRadius.circular(borderRadiusTheme),
                      border:
                          Border.all(color: inputFieldBackgroundColorBorder),
                    ),
                  ),
                ],
              ),
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text("Confirm to continue",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.bodyText2?.fontWeight,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2?.fontFamily,
                        color: lightTextBlue)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(navigationNotifierProvider).selectPage(16);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText2?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontWeight,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontFamily,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  style: lightButton,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(navigationNotifierProvider).selectPage(10);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Exit",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText2?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontWeight,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontFamily,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  style: darkButton,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
