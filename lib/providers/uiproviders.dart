import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workspaceNotifierProvider =
    ChangeNotifierProvider((ref) => WorkSpaceProvider());

class WorkSpaceProvider extends ChangeNotifier {
  double? _workspaceHeight = 400;

  double? get workSpaceHeight => _workspaceHeight;

  void setHeight(BuildContext context) async {
    double heightLarge = screenHeightExcludingToolbar(context) -
        MediaQuery.of(context).padding.top;
   // double heightSmall = MediaQuery.of(context).size.height * 0.5;
    _workspaceHeight = heightLarge;
    notifyListeners();
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).height - reducedBy) / dividedBy;
  }

  double screenHeightExcludingToolbar(BuildContext context,
      {double dividedBy = 1}) {
    return screenHeight(context,
        dividedBy: dividedBy, reducedBy: kToolbarHeight);
  }
}
