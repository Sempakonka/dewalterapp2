import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncorrectTicket extends ConsumerWidget {
  static const routeName = '/incorrectTicket';

  const IncorrectTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("incorrect ticket"),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Navigator.defaultRouteName),
                  child: const Text("go back"))
            ],
          ),
        ),
      ),
    );
  }
}
