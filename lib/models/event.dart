class Event {
  Event(
      {required this.id,
      required this.name,
      required this.status,
      required this.startDate,
      required this.endDate,
      required this.banner,
      required this.description,
      required this.location,
      required this.prePayment,
      required this.commission,
      required this.createdBy});

  int id;
  String name;
  int status;
  DateTime startDate;
  DateTime endDate;
  String banner;
  String description;
  String location;
  int prePayment;
  int commission;
  int createdBy;
}
