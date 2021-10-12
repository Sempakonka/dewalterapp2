import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/pages/scanner/login_as_scanner.dart';
import 'package:de_walter_app_2/providers/auth_providers.dart';
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
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 16, 172, 132)),
            headline2: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 16, 172, 132)),
            bodyText2: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 16, 172, 132)),
          ),
        ),
        routes: {
          '/': (context) => const AuthChecker(),
        },
      ),
    ),
  );
}

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(sessionNotifierProvider);
    //   _authState.uid == null ? const SignInPage() : ChooseEventPage();
    if (_authState.uid == null) {
      return const NavigationBarScreen();
    } else {
      return LoginAsScanner();
    }
  }
}
