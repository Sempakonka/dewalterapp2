import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/pages/scanner/already_scanned_ticket.dart';
import 'package:de_walter_app_2/pages/scanner/incorrect_ticket.dart';
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
          scaffoldBackgroundColor: darkBlue,
          fontFamily: 'Montserrat',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: darkBlue,
            ),
            headline2: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: darkBlue,),
            bodyText1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w100,
                color: lightTextBlue,),
            bodyText2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w100,
              color: lightTextBlue,)
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
    /// Auth state check
    final _authState = ref.watch(sessionNotifierProvider);
    if (_authState.user == null) {
      return const App();
    } else {
      return const App();
    }
  }
}
