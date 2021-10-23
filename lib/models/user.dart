class User {
  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.code,
      required this.status,
      required this.phone,
      required this.rank});

  int id;
  String username;
  String name;
  String email;
  String phone;
  int rank;
  int code;
  String status;
}
