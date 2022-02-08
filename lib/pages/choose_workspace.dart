import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitted_text_field_container/fitted_text_field_container.dart';


import '../globals.dart';

class ChooseWorkspace extends ConsumerWidget {
  final chooseWorkspaceKey = GlobalKey();

  ChooseWorkspace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController workspaceController = TextEditingController();
    return Padding(
      key: chooseWorkspaceKey,
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Text("Welcome",
                      style: Theme.of(context).textTheme.headline1)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text("Enter your workspace",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusTheme),
                    color: inputFieldBackgroundColor,
                    border: Border.all(
                      color: lightPurple,
                      width: 2,
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image(
                            image: AssetImage('assets/workspaceIcon.png')),
                      ),
                      // icon is 48px widget.
                    ),
                    FittedTextFieldContainer(
                      child: TextField(
                        controller: workspaceController,
                        decoration: const InputDecoration(
                          hintText: "your-workspace",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: lightPurple,
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.bodyText2?.fontWeight,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                        ),
                      ),
                    ),
                    Text(
                      ".tickvent.com",
                      style: TextStyle(
                        color: lightPurple,
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.bodyText2?.fontWeight,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2?.fontFamily,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(navigationNotifierProvider).selectPage(0);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Continue",
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(navigationNotifierProvider).selectPage(9);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Valid",
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
                        "Red",
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(navigationNotifierProvider).selectPage(11);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Yellow",
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
              )
            ],
          )
        ],
      ),
    );
  }
}
