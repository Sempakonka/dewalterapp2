import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workspaceNotifierProvider =
    ChangeNotifierProvider((ref) => WorkSpaceProvider());

class WorkSpaceProvider extends ChangeNotifier {
  double? _workspaceHeight = 400;

  double? get workSpaceHeight => _workspaceHeight;

  int _direction = 0;

  int get direction => _direction;

  void setHeight(BuildContext context, {required int direction}) async {
    _direction = direction;
    double heightLarge = (screenHeightExcludingToolbar(context) -
            MediaQuery.of(context).padding.top) /
        100 *
        88;
    double heightSmall = (screenHeightExcludingToolbar(context) -
            MediaQuery.of(context).padding.top) /
        100 *
        40;
    if (direction == 1) {
      _workspaceHeight = heightLarge;
    } else {
      _workspaceHeight = heightSmall;
    }
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
