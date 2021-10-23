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
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Material(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 8),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black38),
                  labelText: "Gebruikersnaam",
                  fillColor: Colors.black12,
                ),
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
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black38),
                  labelText: "Wachtwoord",
                  fillColor: Colors.black12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () async => await _auth
                      .tryToLoginAsScanner(
                          _usernameController.text, _passwordController.text, ref)
                      .then((value) => ref.read(navigationNotifierProvider).selectPage(2))
                      .onError((error, stackTrace) => print(error)),
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
