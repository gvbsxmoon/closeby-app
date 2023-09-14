import 'package:closeby/model/user_model.dart';
import 'package:get/get.dart';

class LoginModel {
  User user = User();
  final RxBool _isLogged = false.obs;
  
  LoginModel._();

  static final LoginModel _instance = LoginModel._();

  bool get isLogged => _isLogged.value;

  factory LoginModel() {
    return _instance;
  }
}