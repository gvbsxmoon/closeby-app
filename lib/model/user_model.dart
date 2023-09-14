import 'package:get/get.dart';

class User {
  RxString fullName = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;

  User._();

  static final User _instance = User._();

  factory User() {
    return _instance;
  }
}
