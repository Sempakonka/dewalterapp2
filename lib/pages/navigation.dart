import 'dart:collection';

import 'package:animations/animations.dart';
import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/pages/scanner/choose_event.dart';
import 'package:de_walter_app_2/pages/scanner/login_as_scanner.dart';
import 'package:de_walter_app_2/pages/scanner/people_scanned_of_event_page.dart';
import 'package:de_walter_app_2/pages/scanner/scan_ticket_page.dart';
import 'package:de_walter_app_2/pages/sign_in.dart';
import 'package:de_walter_app_2/providers/uiproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: constant_identifier_names
enum NavigationBarEvent { NEWS, EVENTS }

final navigationNotifierProvider =
    ChangeNotifierProvider((ref) => NavigationNotifier(ref.read));

class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() => _instance;

  Widget body = const SignInPage();

  Singleton._internal();
}

class NavigationNotifier extends ChangeNotifier {
  late final Reader read;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool _reverse = false;

  bool get reverse => _reverse;

  NavigationNotifier(this.read);

  ListQueue<int> _navigationHistory = ListQueue.from([0]);

  ListQueue<int> get navigationHistory => _navigationHistory;

  void pop({BuildContext? context, final args}) {
    _reverse = true;
    _navigationHistory.removeLast();
    selectPage(_navigationHistory.last,
        args: args, context: context, isPopRequest: true, reverse: true);
  }

  void selectPage(int i,
      {final args, final context, bool? isPopRequest, bool? reverse}) {
    _reverse = reverse ?? false;
    isPopRequest = isPopRequest ?? false;
    switch (i) {
      case 0:
        Singleton().body = const SignInPage();
        read(workspaceNotifierProvider).setHeight(context, direction: 0);
        _currentIndex = 0;
        break;
      case 1:
        Singleton().body = const LoginAsScanner();
        _currentIndex = 1;
        break;
      case 2:
        Singleton().body = const ChooseEvent();
        break;
      case 3:
        Singleton().body = PeopleScannedOfEvent(args: args);

        break;
      case 4:
        Singleton().body = ScanTicketPage(args: args);
        break;
      case 6:
        //    _body = AccountSettings();
        break;
    }
    if (!isPopRequest) {
      _navigationHistory.add(i);
    }
    notifyListeners();
  }
}

class PageModel {
  const PageModel(this.page);

  final NavigationBarEvent page;
}

class NavigationBarScreen extends ConsumerWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showBackButton =
        !(ref.watch(navigationNotifierProvider).navigationHistory.length == 1);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: showBackButton
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_back_outlined),
              onPressed: () => ref.watch(navigationNotifierProvider).pop(
                  context: context,
                  args: SelectedEventSingleton().selectedEvent),
              backgroundColor: green,
            )
          : Container(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Image(image: AssetImage('assets/logo.png')),
                ),
              ),
              WorkSpace()
            ],
          ),
        ),
      ),
    );
  }
}

class WorkSpace extends HookConsumerWidget {
  final Duration duration = const Duration(milliseconds: 600);

  const WorkSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The final gets used by riverpod but does not get picked up by dart analyser
    // ignore: unused_local_variable
    final pageModel = ref.watch(navigationNotifierProvider);

    var _height = ref.watch(workspaceNotifierProvider).workSpaceHeight;

    var reverse = ref.watch(navigationNotifierProvider).reverse;

    SharedAxisTransitionType? _transitionType =
        SharedAxisTransitionType.horizontal;

    return AnimatedContainer(
      curve: Curves.easeInOutCubic,
      onEnd: ref.watch(workspaceNotifierProvider).direction == 1
          ? () =>
              ref.read(navigationNotifierProvider).selectPage(1, args: context)
          : null,
      height: _height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      duration: duration,
      child: PageTransitionSwitcher(
        key: key,
        duration: const Duration(milliseconds: 700),
        reverse: reverse,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            fillColor: Colors.transparent,
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: _transitionType,
          );
        },
        child: Singleton().body,
      ),
    );
  }
}
