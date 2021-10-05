import 'package:dbcrypt/dbcrypt.dart' as db;
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future tryToLoginAsScanner(String username, String password) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn
      .query('select rank, password from users where username = ?', [username]);
  await conn.close();

  for (var row in result) {
    print(row[1]);
    if (row[1] != null) {
      bool isCorrectPassword = db.DBCrypt().checkpw(password, row[1]);
      if (isCorrectPassword) {
        if (row[0] == 3) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('username', username);
        } else {
          return Future.error("Incorrect");
        }
      } else {
        return Future.error("Incorrect");
      }
    } else {
      return Future.error("Incorrect");
    }
  }
  return Future.error("Incorrect");
}
