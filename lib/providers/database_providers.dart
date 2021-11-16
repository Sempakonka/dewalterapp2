import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final content = await getAllActiveEvents();
  return content;
});

final ticketsAtScannedByProvider = ChangeNotifierProvider((ref) => TicketsAtScannedByNotifier());

class TicketsAtScannedByNotifier extends ChangeNotifier{
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  void fetchTickets(int uid, int eventId) async{
    _tickets = await getTicketAtScannedByAndEventId(uid, eventId);
    notifyListeners();
  }
}

final ticketsAtCreatedByProvider = ChangeNotifierProvider((ref) => TicketsAtScannedByNotifier());

class TicketsAtCreatedByNotifier extends ChangeNotifier{
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  void fetchTickets(int uid) async{
    _tickets = await getTicketsAtCreatedBy(uid);
    notifyListeners();
  }
}

