import 'package:closeby/model/user_model.dart';

class LoginModel {
  User user = User();
  bool isLogged = false;
  
  LoginModel._();

  static final LoginModel _instance = LoginModel._();

  factory LoginModel() {
    return _instance;
  }
}