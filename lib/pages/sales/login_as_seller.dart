import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../navigation.dart';

class LoginAsSeller extends ConsumerWidget {
  const LoginAsSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _passwordFormKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                "Get Started",
                style: Theme.of(context).textTheme.headline1,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Login To Continue!",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
            child: Container(
              height: 60,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(Icons.email),
                  ),
                  Text("Square", style: Theme.of(context).textTheme.headline2)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadiusTheme),
                boxShadow: [
                  BoxShadow(
                    color: lightPurple.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: _passwordFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 28, 0, 2),
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 15),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.mail_rounded,
                          color: lightPurple,
                        ), // icon is 48px widget.
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: lightPurple, width: 2),
                        borderRadius: BorderRadius.circular(borderRadiusTheme),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: inputFieldBackgroundColor, width: 0),
                        borderRadius: BorderRadius.circular(borderRadiusTheme),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize,
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 2),
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 15),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.lock,
                          color: lightPurple,
                        ), // icon is 48px widget.
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: lightPurple, width: 2),
                        borderRadius: BorderRadius.circular(borderRadiusTheme),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: inputFieldBackgroundColor, width: 0),
                        borderRadius: BorderRadius.circular(borderRadiusTheme),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize,
                          color: lightPurple),
                      labelText: "Password",
                      fillColor: inputFieldBackgroundColor,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field is empty";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: ElevatedButton(
                onPressed: () =>
                    ref.read(navigationNotifierProvider).selectPage(5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.bodyText2?.fontWeight,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                style: darkButton),
          )
        ],
      ),
    );
  }
}

class _ExampleAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: SizedBox(
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Wrong username or password",
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: const BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0)),
                ),
                child: const Text(
                  "Ok",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
