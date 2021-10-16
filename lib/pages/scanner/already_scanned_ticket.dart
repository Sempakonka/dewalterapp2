import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlreadyScanned extends ConsumerWidget {
  const AlreadyScanned({Key? key}) : super(key: key);

  static const routeName = '/alreadyScannedTicket';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("go back"))
          ],
        ),
      ),
    );
  }
}
