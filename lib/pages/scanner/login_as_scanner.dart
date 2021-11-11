import 'package:animations/animations.dart';
import 'package:de_walter_app_2/services/auth_services.dart' as _auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globals.dart';
import '../navigation.dart';

class LoginAsScanner extends ConsumerWidget {
  const LoginAsScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _passwordFormKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                child: Text(
                  "Welkom scanner",
                  style: Theme.of(context).textTheme.headline1,
                )),
            SizedBox(
                width: double.infinity,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                  "sed do eiusmod tempor incididunt ut labore et dolore "
                  "magna aliqua. Ut enim ad minim veniam, quis nostrud "
                  "exercitation ullamco laboris nisi ut",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black87),
                )),
            Form(
              key: _passwordFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 8),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        //     errorText: "Wrong password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                Theme.of(context).textTheme.bodyText2!.fontSize,
                            color: Colors.black38),
                        labelText: "Gebruikersnaam",
                        fillColor: Colors.black12,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                Theme.of(context).textTheme.bodyText2!.fontSize,
                            color: Colors.black38),
                        labelText: "Wachtwoord",
                        fillColor: Colors.black12,
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
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_passwordFormKey.currentState!.validate()) {
                      await _auth
                          .tryToLoginAsScanner(_usernameController.text,
                              _passwordController.text, ref)
                          .then((value) =>
                              ref.read(navigationNotifierProvider).selectPage(2))
                          .onError((error, stackTrace) {
                            print(error);
                        showModal<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return _ExampleAlertDialog();
                          },
                        );
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Inloggen",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText2!.fontSize),
                      ),
                      const Icon(Icons.arrow_forward_rounded)
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
        ),
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
