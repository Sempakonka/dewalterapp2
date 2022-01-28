import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/models/ticket.dart';
import 'package:mysql1/mysql1.dart';

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
        prePayment: double.parse((row[8].toStringAsFixed(2))),
        commission: double.parse((row[9].toStringAsFixed(2))),
        createdBy: row[10]));
  }

  //    var allEvents = Events(events: eventsList);

  return eventsList;
}

Future<List<Ticket>> getTicketAtScannedByAndEventId(int userId,
    int eventId) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn.query(
      'select * from tickets where scanned_by = ? and event_id = ?',
      [userId, eventId]);
  await conn.close();

  List<Ticket> tickets = [];
  for (var row in result) {
    tickets.add(Ticket(
        id: row[0],
        eventId: row[1],
        status: row[2],
        name: row[3],
        email: row[4],
        createdAt: row[5],
        createdBy: row[6],
        scannedAt: row[7],
        scannedBy: row[8],
        tickedCode: row[9],
        userCommission: double.parse((row[10]).toStringAsFixed(2)),
        prePayment: double.parse((row[11]).toStringAsFixed(2)),
        ticketPrice: double.parse((row[12]).toStringAsFixed(2))));
  }
  tickets.forEach((element) {
    print(element);
  });

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

Future getTicketsAtCreatedBy(int createdBy) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn
      .query('select * from tickets where created_by = ?', [createdBy]);
  await conn.close();

  List<Ticket> tickets = [];
  for (var row in result) {
    tickets.add(Ticket(
        id: row[0],
        eventId: row[1],
        status: row[2],
        name: row[3],
        email: row[4],
        createdAt: row[5],
        createdBy: row[6],
        scannedAt: row[7],
        scannedBy: row[8],
        tickedCode: row[9],
        userCommission: double.parse((row[10]).toStringAsFixed(2)),
        prePayment: double.parse((row[11]).toStringAsFixed(2)),
        ticketPrice: double.parse((row[12]).toStringAsFixed(2))));
  }
  for (var element in tickets) {
    print(element);
  }

  return tickets;
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

Future checkInTicket(String ticketCode, DateTime scannedAt,
    int scannedBy) async {
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
          'scanned_by = ?,'
          'status = 1 '
          'where ticket_code = ?',
      [scannedAt, scannedBy, ticketCode]);
  await conn.close();
  for (var row in result) {
    return row[0];
  }
}

Future<Ticket?> getTicketByCode(String ticketCode) async {
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
    return Ticket(
        id: row[0],
        eventId: row[1],
        status: row[2],
        name: row[3],
        email: row[4],
        createdAt: row[5],
        createdBy: row[6],
        scannedAt: row[7],
        scannedBy: row[8],
        tickedCode: row[9],
        userCommission: double.parse((row[10]).toStringAsFixed(2)),
        prePayment: double.parse((row[11]).toStringAsFixed(2)),
        ticketPrice: double.parse((row[12]).toStringAsFixed(2)));
  }
  return null;
}


Future<Event?> getEventById(int eventId) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var result = await conn
      .query('select * from events where id = ?', [eventId]);
  await conn.close();

  for (var row in result) {
    return Event(
        id: row[0],
        name: row[1],
        status: row[2],
        startDate: row[3],
        endDate: row[4],
        banner: row[5],
        description: row[6].toString(),
        location: row[7],
        prePayment: double.parse((row[8].toStringAsFixed(2))),
        commission: double.parse((row[9].toStringAsFixed(2))),
        createdBy: row[10]);
  }
  return null;
}


Future insertNewTicket(
    int eventId,
    int status,
    String name,
    String email,
    String createdAt,
    int createdBy,
    String? scannedAt,
    int? scannedBy,
    String ticketCode) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));
  // Open a connection (testdb should already exist)

  await conn.query(
      'insert into tickets (event_id, status, name, email, created_at, created_by, ticket_code) values (?, ?, ?, ?, ? ,?, ?)',
      [eventId, name, status, email, createdAt, createdBy, ticketCode]);
  print("inserted ticket");
  // Finally, close the connection
  await conn.close();
}


Future getAvailableTicketsAtEventId(int eventId) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '185.104.29.16',
      port: 3306,
      user: 'u9894p21510_app',
      db: 'u9894p21510_app',
      password: '4TjTcdnE'));

  var amountOfSoldTicketsQuery = await conn
      .query('select count(*) from tickets where event_id = ?', [eventId]);
  int amountOfSoldTickets = 0;
  for (var row in amountOfSoldTicketsQuery) {
    amountOfSoldTickets = row[0];
  }

  bool hasFound = false;
  int sequence = 1;
  int? result;
  while (!hasFound) {
    print("iteration");
    var availableTicketsAtSequenceQuery = await conn.query(
        'select count from event_price where event_id = ? and sequence = ?',
        [eventId, sequence]);
    for (var row in availableTicketsAtSequenceQuery) {
      if ((row[0] - amountOfSoldTickets) > 0) {
        hasFound = true;
        print("${row[0]} $amountOfSoldTickets");
        result = (row[0] - amountOfSoldTickets);
      } else {
        amountOfSoldTickets = amountOfSoldTickets - row[0] as int;
        //TODO add error handling when row == null thus not finding anything
        sequence++;
        continue;
      }
    }
  }
  // Finally, close the connection
  await conn.close();

  return(result.toString());
}