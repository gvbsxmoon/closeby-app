import 'package:closeby/model/observable/login_model.dart';
import 'package:closeby/model/static/user_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  LoginModel model = LoginModel();

  void login(Map<String, dynamic> json) {
    //api call for login
    model.user = UserModel.fromJson(json);
    model.isLogged = true;
  }

  bool checkEmail(String email) {
    //api call for check email
    return true;
  }
}
