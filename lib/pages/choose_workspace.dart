import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../globals.dart';

class ChooseWorkspace extends ConsumerWidget {
  final chooseWorkspaceKey = GlobalKey();

  ChooseWorkspace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                decoration: const BoxDecoration(
                  // color: const Color(0xFFF1F0FA),
                  // border: Border.all(color: const Color(0xFF6C5CE7), width: 1)
                ),
                child: Row(
                  children: const [
                    Expanded(child: Icon(Icons.business_center)),
                    Expanded(
                      child: TextField(
                        // ...
                      ),
                    ),
                    Expanded(child: Text(".tickvent.com"))
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
                padding: const EdgeInsets.fromLTRB(0, 42, 0, 2),
                child: TextFormField(
                  controller: null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 15),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.work_outline_rounded,
                        color: lightPurple,
                      ), // icon is 48px widget.
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: lightPurple, width: 2),
                      borderRadius: BorderRadius.circular(borderRadiusTheme),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: lightPurple, width: 2),
                      borderRadius: BorderRadius.circular(borderRadiusTheme),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.bodyText2!.fontSize,
                        color: lightPurple),
                    labelText: "Workspace-url",
                    fillColor: inputFieldBackgroundColor,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is empty";
                    }
                  },
                ),
              ),
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
                        "Valid",
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
                    ref.read(navigationNotifierProvider).selectPage(0);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Continue",
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
                    ref.read(navigationNotifierProvider).selectPage(0);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Red",
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
                    ref.read(navigationNotifierProvider).selectPage(0);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Yellow",
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
