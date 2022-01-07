import 'package:de_walter_app_2/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils.dart';

final workspaceNotifierProvider =
    ChangeNotifierProvider((ref) => WorkSpaceProvider());

class WorkSpaceProvider extends ChangeNotifier {
  double? _workspaceHeight = 400;

  double? get workSpaceHeight => _workspaceHeight;

  int? _pageToGoOnEnd;

  /// Page that [App] will go to on end of size transition animation of
  /// Workplace
  int? get pageToGoOnEnd => _pageToGoOnEnd;

  bool _workplaceHeightIsSet = false;

  /// Used in [AuthChecker].
  bool get workplaceHeightIsSet => _workplaceHeightIsSet;

  void setPageToGoOnEnd(int? pageToGoOnEnd){
    _pageToGoOnEnd = pageToGoOnEnd;
  }

  void setWorkPlaceHeightIsSet(bool value) {
    _workplaceHeightIsSet = value;
    notifyListeners();
  }

  void setHeightInPercentage(int percentageOfScreen, {required BuildContext context,
    int? pageToGoOnEnd
  }){
    _pageToGoOnEnd = pageToGoOnEnd;

    _workspaceHeight = getCorrectHeightFromPercentage(percentageOfScreen, context);

    notifyListeners();
  }

  void setHeight(BuildContext context,
      {required int direction, int? pageToGoOnEnd}) async {
    _pageToGoOnEnd = pageToGoOnEnd;

    double heightLarge = (screenHeightExcludingToolbar(context) -
            MediaQuery.of(context).padding.top) /
        100 *
        88;
    double heightSmall = (screenHeightExcludingToolbar(context) -
            MediaQuery.of(context).padding.top) /
        100 *
        55;
    if (direction == 1) {
      _workspaceHeight = heightLarge;
    } else {
      _workspaceHeight = heightSmall;
    }
    notifyListeners();
  }

  double getCorrectHeightFromPercentage(int percentage, BuildContext context){
    return   (screenHeightExcludingToolbar(context) -
        MediaQuery.of(context).padding.top) /
        100 * percentage;
  }
}

final formControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
