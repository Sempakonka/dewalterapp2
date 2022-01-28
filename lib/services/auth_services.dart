import 'package:dbcrypt/dbcrypt.dart' as db;
import 'package:de_walter_app_2/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future tryToLoginAsScanner({
    required String email, required String password} ) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'u9894p125778_app',
      db: 'u9894p125778_app',
      password: 'abiiI3k3'));

  var result =
      await conn.query('select * from users where email = ?', [email]);
  await conn.close();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  for (var row in result) {
  /*  if (row[2] != null) {
      bool isCorrectPassword = db.DBCrypt().checkpw(password, row[2]);

      if (isCorrectPassword) {
        if (row[6] == 3) {
          ref.read(sessionNotifierProvider).setUser(
              id: row[0],
              name: row[1],
              username: row[3],
              email: row[4],
              phone: row[5],
              rank: row[6]);
          return;
        } else {
          return Future.error("Incorrect at rank check");
        }
      } else {
        return Future.error("Incorrect at isCorrectPassword");
      }
    } else {
      return Future.error("Incorrect at is not null element");
    }*/
  }
  return Future.error("Not implemented");
}


Future tryToLoginAsSeller(
    String username, String password, WidgetRef ref) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'u9894p125778_app',
      db: 'u9894p125778_app',
      password: 'abiiI3k3'));

  var result =
  await conn.query('select * from users where username = ?', [username]);
  await conn.close();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  for (var row in result) {
    if (row[2] != null) {
      bool isCorrectPassword = db.DBCrypt().checkpw(password, row[2]);

      if (isCorrectPassword) {
        if (row[6] == 2) {
          ref.read(sessionNotifierProvider).setUser(
              id: row[0],
              name: row[1],
              username: row[3],
              email: row[4],
              phone: row[5],
              rank: row[6]);
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
