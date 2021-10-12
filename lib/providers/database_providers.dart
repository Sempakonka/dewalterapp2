import 'package:de_walter_app_2/models/event.dart';
import 'package:de_walter_app_2/models/ticket.dart';
import 'package:de_walter_app_2/services/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final content = await getAllActiveEvents();
  return content;
});

final ticketsAtScannedByProvider =
    FutureProvider.family<List<Ticket>, int>((ref, id) async {
  final result = await getTicketAtScannedBy(id);
  return result;
});
