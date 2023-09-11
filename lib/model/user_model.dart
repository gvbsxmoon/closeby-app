class User {
  String fullName = "";
  String email = "";
  String password = "";

  User._();

  static final User _instance = User._();

  factory User() {
    return _instance;
  }
}
