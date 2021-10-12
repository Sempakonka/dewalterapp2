import 'package:de_walter_app_2/models/ticket.dart';
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

Future<List<Ticket>> getTicketAtScannedBy(int userId) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query('select * from tickets where scanned_by = ?', [userId]);
  await conn.close();

  List<Ticket> tickets = [];
  for (var row in result) {
    tickets.add(Ticket(id: row[0],
        eventId: row[1],
        status: row[2],
        name: row[3],
        email: row[4],
        createdAt: row[5],
        createdBy: row[6],
        scannedAt: row[7],
    scannedBy: row[8],
    tickedCode: row[9]));
  }

  return tickets;
}

Future checkIfAlreadyScanned(String ticketCode) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query(
      'select scanned_by from tickets where ticket_code = ?', [ticketCode]);
  await conn.close();

  // Finally, close the connection
  for (var row in result) {
    if (row[0] == null) {
      return false;
    } else {
      return true;
    }
  }
}

Future checkQrIDExistence(String ticketCode) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query(
      'select exists(select * from tickets where ticket_code = ?)',
      [ticketCode]);
  await conn.close();
  for (var row in result) {
    return row[0];
  }
}

Future checkSelectedEventIsEqualToTicketEvent(String ticketCode) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query(
      'select event_id from tickets where ticket_code = ?', [ticketCode]);
  await conn.close();
  for (var row in result) {
    return row[0];
  }
}

Future checkInTicket(String ticketCode, DateTime scannedAt, int scannedBy) async {
  scannedAt = scannedAt.toUtc();
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query(
      'update tickets set '
          'scanned_at = ?,'
          'scanned_by = ? '
          'where ticket_code = ?',
      [scannedAt, scannedBy, ticketCode]);
  await conn.close();
  for (var row in result) {
    return row[0];
  }
}




Future getTicketByCode(String ticketCode) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn
      .query('select * from tickets where ticket_code = ?', [ticketCode]);
  await conn.close();

  for (var row in result) {
    return Ticket(id: row[0],
        eventId: row[1],
        status: row[2],
        name: row[3],
        email: row[4],
        createdAt: row[5],
        createdBy: row[6],
        tickedCode: row[9]);
  }
  return null;
}


