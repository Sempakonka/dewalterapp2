import 'dart:collection';

import 'package:animations/animations.dart';
import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/pages/choose_workspace.dart';
import 'package:de_walter_app_2/pages/sales/history_of_tickets_made.dart';
import 'package:de_walter_app_2/pages/sales/login_as_seller.dart';
import 'package:de_walter_app_2/pages/scanner/choose_event.dart';
import 'package:de_walter_app_2/pages/scanner/incorrect_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/login_as_scanner.dart';
import 'package:de_walter_app_2/pages/scanner/people_scanned_of_event_page.dart';
import 'package:de_walter_app_2/pages/scanner/scan_ticket_page.dart';
import 'package:de_walter_app_2/pages/choose_activity.dart';
import 'package:de_walter_app_2/pages/scanner/valid_ticked.dart';
import 'package:de_walter_app_2/pages/ticket_viewer.dart';
import 'package:de_walter_app_2/providers/auth_providers.dart';
import 'package:de_walter_app_2/providers/database_providers.dart';
import 'package:de_walter_app_2/providers/uiproviders.dart';
import 'package:de_walter_app_2/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: constant_identifier_names
enum NavigationBarEvent { NEWS, EVENTS }

final navigationNotifierProvider =
    ChangeNotifierProvider((ref) => NavigationNotifier(ref.read));

/// This is a singleton containing a widget
/// This widget contains the page that is displayed on screen in the "Workplace"
class BodySingleton {
  static final BodySingleton _instance = BodySingleton._internal();

  factory BodySingleton() => _instance;

  /// The body initializes with the [ChooseActivity]
  Widget? body  = ChooseWorkspace();

  BodySingleton._internal();
}

class NavigationNotifier extends ChangeNotifier {
  late final Reader read;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool _reverse = false;

  bool get reverse => _reverse;

  NavigationNotifier(this.read);

  ListQueue<int> _navigationHistory = ListQueue.from([8]);

  ListQueue<int> get navigationHistory => _navigationHistory;

  void pop({BuildContext? context, final args}) {
    /// Remove the page index that was last added in order to get previous page
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
        BodySingleton().body = const ChooseActivity();
        _currentIndex = 0;
        break;
      case 1:
        BodySingleton().body = const LoginAsScanner();
        _currentIndex = 1;
        break;
      case 2:
        BodySingleton().body = const ChooseEvent();
        break;
      case 3:
        read(ticketsAtScannedByProvider).fetchTickets(
            1, args['eventId']);

        BodySingleton().body = PeopleScannedOfEvent(args: args);
        break;
      case 4:
        BodySingleton().body = ScanTicketPage(args: args);
        break;
      case 5:
        BodySingleton().body = const LoginAsSeller();
        break;
      case 6:
        BodySingleton().body = const HistoryOfTicketsMade();
        break;
      case 7:
        BodySingleton().body = TicketViewer(args: args);
        break;
      case 8:
        BodySingleton().body = ChooseWorkspace();
        break;
      case 9:
        BodySingleton().body = const ValidTicket();
        break;
      case 10:
        BodySingleton().body = const IncorrectTicket();
        break;
    }

    /// If user does not go back a page then page where he came from needs to be
    /// added to navigation history to be able to go back if he wants to later
    if (!isPopRequest) {
      _navigationHistory.add(i);
    }
    notifyListeners();
  }
}

/// This class both the upper and lower "Workplace" half of the app
class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showBackButton =
        !(ref.watch(navigationNotifierProvider).navigationHistory.length == 1);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: showBackButton
          ? Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,0),
            child: FloatingActionButton(
        elevation: 0,
                child: const Icon(Icons.arrow_back_outlined, size: 40,),
                onPressed: () => ref.watch(navigationNotifierProvider).pop(
                    context: context,
                    args: SelectedEventSingleton().selectedEvent),
                backgroundColor: Colors.transparent,
              ),
          )
          : Container(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/achtergrond.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                /// Upper half
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50.0,60,50,40),
                    child: Image(image: AssetImage('assets/logo.png')),
                  ),
                ),

                /// Lower half
                WorkPlace()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// This class contains the lower half of the app
class WorkPlace extends HookConsumerWidget {
  final Duration duration = const Duration(milliseconds: 600);

  const WorkPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The final pageModel gets used by riverpod but does not get picked up by dart analyser
    // ignore: unused_local_variable
    final pageModel = ref.watch(navigationNotifierProvider);

    /// The height of the workspace
    var _height = ref.watch(workspaceNotifierProvider).workSpaceHeight;

    /// If the transition animation between pages needs to be in reverse
    /// When going back a page it needs to be in reverse
    var reverse = ref.watch(navigationNotifierProvider).reverse;

    /// Transition animation setup for the switch between pages.
    SharedAxisTransitionType? _transitionType =
        SharedAxisTransitionType.horizontal;

    final _pageToGoOnEnd = ref.watch(workspaceNotifierProvider).pageToGoOnEnd;

    return AnimatedContainer(
      curve: Curves.easeInOutCubic,

      /// If navigation action is coming from the root
      onEnd: _pageToGoOnEnd != null
          ? () {
              ref
                  .read(navigationNotifierProvider)
                  .selectPage(_pageToGoOnEnd, args: context);
              ref.read(workspaceNotifierProvider).setPageToGoOnEnd(null);
            }
          : null,
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
        duration: const Duration(milliseconds: 400),
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

            child: BodySingleton().body,
      ),
    );
  }
}
