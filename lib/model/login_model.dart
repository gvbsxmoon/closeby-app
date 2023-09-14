import 'package:closeby/model/user_model.dart';
import 'package:get/get.dart';

class LoginModel {
  User user = User();
  RxBool loggedIn = false.obs;
  
  LoginModel._();

  static final LoginModel _instance = LoginModel._();

  static bool get isLogged => _instance.loggedIn.value;

  factory LoginModel() {
    return _instance;
  }
}