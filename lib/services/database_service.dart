import 'package:mysql1/mysql1.dart';
import 'package:de_walter_app_2/models/event.dart';

Future<List<Event>> getAllActiveEvents() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query('select * from events where status = 1');
  await conn.close();

  List<Event> eventsList = [];
  for (var row in result) {
    eventsList.add(Event(
        id: row[0],
        name: row[1],
        status: row[2],
        startDate: row[3],
        endDate: row[4],
        banner: row[5],
        description: row[6].toString(),
        location: row[7],
        prePayment: row[8],
        commission: row[9],
        createdBy: row[10]));
  }

  //    var allEvents = Events(events: eventsList);

  return eventsList;
}
String formatDate(String dbDate){
  List<String> dateTimeList = dbDate.split(" ");
  List<String> dateList = dateTimeList.first.split("-");
  String dateTime = dateList[1]+"-"+dateList.last+"-"+dateList.first + " "+ dateTimeList.last;
  return dateTime;
}