import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../globals.dart';

class ChooseWorkspace extends ConsumerWidget {
  const ChooseWorkspace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 50, 40, 9),
      child: Column(
        children: [
          Column(
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
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.work_outline_rounded,
                          color: lightPurple,
                        ), // icon is 48px widget.
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: lightPurple, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: lightPurple, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                          color: lightPurple),
                      labelText: "Wachtwoord",
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
                  padding: const EdgeInsets.fromLTRB(0,10,0,10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,7,0,7),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                              fontWeight: Theme.of(context).textTheme.bodyText2?.fontWeight,
                              fontFamily: Theme.of(context).textTheme.bodyText2?.fontFamily,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(

                        primary: darkBlue,
                        //background color of button
                        //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        padding: const EdgeInsets.all(10) //content padding inside button
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
