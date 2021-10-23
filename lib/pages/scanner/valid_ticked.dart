import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidTicket extends ConsumerWidget {
  static const routeName = '/validTicket';

  const ValidTicket({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.green,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("go back"))
            ],
          ),
        ),
      ),
    );
  }
}
