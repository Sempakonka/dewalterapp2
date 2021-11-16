import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketViewer extends ConsumerWidget{
  const TicketViewer({Key? key, required this.args}) : super(key: key);

  final args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,0),
          child: Text(
            "Ticket holder",
            style: Theme.of(context).textTheme.headline2,
          ),
        )
      ],
    );
  }

}