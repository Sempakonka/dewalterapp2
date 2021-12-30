import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/pages/scanner/already_scanned_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/incorrect_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/login_as_scanner.dart';
import 'package:de_walter_app_2/pages/scanner/valid_ticked.dart';
import 'package:de_walter_app_2/providers/auth_providers.dart';
import 'package:de_walter_app_2/providers/uiproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 16, 172, 132),
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 16, 172, 132)),
            headline2: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 16, 172, 132)),
            bodyText2: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 16, 172, 132)),
          ),
        ),
        routes: {
          '/': (context) => const AuthChecker(),
          ValidTicket.routeName: (context) => const ValidTicket(),
          AlreadyScanned.routeName: (context) => const AlreadyScanned(),
          IncorrectTicket.routeName: (context) => const IncorrectTicket(),
        },
      ),
    ),
  );
}

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// After opening app the "Workplace" height needs to be set
    /// So, we first check if the ""Workplace" height is set
    /// If not then set the workspace height first
    if (!ref.read(workspaceNotifierProvider).workplaceHeightIsSet) {
      Future.delayed(Duration.zero,
              () =>
              ref.read(workspaceNotifierProvider).setHeight(
                  context, direction: 0)
      );
      ref.read(workspaceNotifierProvider).setWorkPlaceHeightIsSet(true);
    }

    /// Auth state check
    final _authState = ref.watch(sessionNotifierProvider);
    if (_authState.user == null) {
      return const App();
    } else {
      return const App();
    }
  }
}
