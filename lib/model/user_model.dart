import 'package:get/get.dart';

class User {
  final RxString _fullName = "".obs;
  final RxString _email = "".obs;
  final RxString _password = "".obs;

  User._();

  static final User _instance = User._();

  factory User() {
    return _instance;
  }

  String get fullName => _fullName.value;

  set fullName(String value) => _fullName.value = value;

  String get email => _email.value;

  set email(String value) => _email.value = value;

  String get password => _password.value;

  set password(String value) => _password.value = value;
}
