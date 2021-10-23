class Ticket {
  Ticket(
      {required this.id,
      required this.eventId,
      required this.status,
      required this.name,
      required this.email,
      required this.createdAt,
      required this.createdBy,
      this.scannedAt,
      this.scannedBy,
      required this.tickedCode,
      this.userCommission});

  int id;
  int eventId;
  int status;
  String name;
  String email;
  DateTime createdAt;
  int createdBy;
  DateTime? scannedAt;
  int? scannedBy;
  String tickedCode;
  int? userCommission;
}
