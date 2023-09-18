import 'package:closeby/model/static/user_model.dart';
import 'package:get/get.dart';

class LoginModel {
  late UserModel user;
  final RxBool _isLogged = false.obs;
  
  LoginModel._();

  static final LoginModel _instance = LoginModel._();

  bool get isLogged => _isLogged.value;
  
  set isLogged(bool value) => _isLogged.value = value;

  factory LoginModel() {
    return _instance;
  }
}