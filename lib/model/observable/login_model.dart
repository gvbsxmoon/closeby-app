import 'package:closeby/model/static/user_model.dart';
import 'package:get/get.dart';

class LoginModel {
  late UserModel user;
  final RxBool _isLogged = false.obs;
  final RxString _email = "".obs;

  LoginModel._();

  static final LoginModel _instance = LoginModel._();

  bool get isLogged => _isLogged.value;

  set isLogged(bool value) => _isLogged.value = value;

  String get email => _email.value;

  set email(String value) => _email.value = value;

  factory LoginModel() {
    return _instance;
  }
}
