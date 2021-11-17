import 'package:de_walter_app_2/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionNotifierProvider =
    ChangeNotifierProvider((ref) => SessionNotifier());

class SessionNotifier extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(
      {required int id,
      required String username,
      required String name,
      required String email,
      required String phone,
      required int rank,
}) async {
    _user = User(
        id: id,
        name: name,
        username: username,
        email: email,
        phone: phone,
        rank: rank);
  }
}
