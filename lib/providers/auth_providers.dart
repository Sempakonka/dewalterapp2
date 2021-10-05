import 'package:de_walter_app_2/services/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionNotifierProvider = ChangeNotifierProvider((ref) => SessionNotifier());

class SessionNotifier extends ChangeNotifier{
  String? _uid;

  String? get uid => _uid;

  void getUid(String username, String password) async {
    _uid = await tryToLoginAsScanner(username, password);
  }
}