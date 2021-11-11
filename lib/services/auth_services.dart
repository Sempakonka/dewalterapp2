import 'package:dbcrypt/dbcrypt.dart' as db;
import 'package:de_walter_app_2/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future tryToLoginAsScanner(
    String username, String password, WidgetRef ref) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result =
      await conn.query('select * from users where username = ?', [username]);
  await conn.close();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  for (var row in result) {
    if (row[2] != null) {
      bool isCorrectPassword = db.DBCrypt().checkpw(password, row[2]);
      if (isCorrectPassword) {
        if (row[6] == 3) {
          preferences.setString('username', username);
          ref.read(sessionNotifierProvider).setUser(
                id: row[0],
                name: row[1],
                username: row[3],
                email: row[4],
                phone: row[5],
                rank: row[6]
              );
          return;
        } else {
          return Future.error("Incorrect at rank check");
        }
      } else {
        return Future.error("Incorrect at isCorrectPassword");
      }
    } else {
      return Future.error("Incorrect at is not null element");
    }
  }
  return Future.error("Incorrect");
}
