import 'package:de_walter_app_2/pages/scanner/choose_event.dart';
import 'package:de_walter_app_2/pages/scanner/login_as_scanner.dart';
import 'package:de_walter_app_2/pages/scanner/people_scanned_of_event_page.dart';
import 'package:de_walter_app_2/pages/scanner/scan_ticket_page.dart';
import 'package:de_walter_app_2/pages/sign_in.dart';
import 'package:de_walter_app_2/providers/uiproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

  NavigationNotifier(this.read);

  void selectPage(int i, [final args]) {
    switch (i) {
      case 0:
        Singleton().body = const SignInPage();
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
    // context.read(newsPageNotifierProvider).getAllNewsItemsFromDatabase();

    return Scaffold(
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
  final Duration duration = const Duration(milliseconds: 400);

  const WorkSpace({Key? key}) : super(key: key);
  static double endPoint = 600;
  static double lowerBound = 350;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    /// final gets used by riverpod but does not get picked up by dart analyser
    final pageModel = ref.watch(navigationNotifierProvider);
    final _controller = useAnimationController(
        duration: duration, upperBound: endPoint, lowerBound: lowerBound);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(navigationNotifierProvider).selectPage(1);
      }
    });

    final _height = ref.watch(workspaceNotifierProvider).workSpaceHeight;
    useValueChanged(_height, (_, __) async {
      _controller.forward();
    });

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
            height: _controller.value,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Singleton().body);
      },
    );
  }
}
