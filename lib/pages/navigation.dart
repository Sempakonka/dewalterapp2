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

enum NavigationBarEvent { NEWS, EVENTS }

final navigationNotifierProvider =
    ChangeNotifierProvider((ref) => NavigationNotifier(ref.read));

class NavigationNotifier extends ChangeNotifier {
//  static const defaultPage = PageModel(NavigationBarEvent.NEWS);
  late final Reader read;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  NavigationNotifier(this.read);

  late Widget _body = const SignInPage();

  Widget get body => _body;

  void selectPage(int i) {
    switch (i) {
      case 0:
        _body = const SignInPage();
        _currentIndex = 0;
        //read(newsPageNotifierProvider).getAllNewsItemsFromDatabase();
        break;
      case 1:
        _body = const LoginAsScanner();
        _currentIndex = 1;
        //     read(eventsNotifierProvider).getAllEventsFromDatabase();
        break;
      case 2:
        _body = const ChooseEvent();
        break;
      case 3:
        _body = const PeopleScannedOfEvent();

        break;
      case 4:
        _body = const ScanTicketPage();
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
            child: pageModel.body);
      },
    );
  }
}
