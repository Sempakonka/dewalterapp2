import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides all events
final allEventsProvider = FutureProvider<List<Event>>((ref) async {
  final content = await getAllActiveEvents();
  return content;
});

/// Provides a bool telling if the ticket is scanned or not
final isScannedProvider = FutureProvider.family<bool, String>((ref, ticketCode) async {
  return await checkIfAlreadyScanned(ticketCode);
});

/// Provides the [Event] containing the given [eventId]
final eventAtIdProvider =  FutureProvider.family<Event?, int>((ref, eventId) async {
  return await getEventById(eventId);
});


/// Provides all tickets that are scanned by current [User]
///
/// User must not be null
final ticketsAtScannedByProvider = ChangeNotifierProvider((ref) => TicketsAtScannedByNotifier());

class TicketsAtScannedByNotifier extends ChangeNotifier{
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  void fetchTickets(int uid, int eventId) async{
    _tickets = await getTicketAtScannedByAndEventId(uid, eventId);
    notifyListeners();
  }
}

/// Provides all tickets that are created by current [User]
///
/// User must not be null
final ticketsAtCreatedByProvider = ChangeNotifierProvider((ref) => TicketsAtScannedByNotifier());

class TicketsAtCreatedByNotifier extends ChangeNotifier{
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  void fetchTickets(int uid) async{
    _tickets = await getTicketsAtCreatedBy(uid);
    notifyListeners();
  }
}

