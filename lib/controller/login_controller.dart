import 'package:closeby/model/observable/login_model.dart';
import 'package:closeby/utils/service.dart';
import 'package:closeby/utils/token.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  LoginModel model = LoginModel();
  final _service = AppService();

  Future<bool> checkEmail(String email) async {
    try {
      final res = await _service.invoke(path: '/auth/check/$email');
      model.email = email;

      return res.statusCode == 409;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final response = await _service.invoke(
        path: '/auth/signin',
        method: HTTPMethod.post,
        body: <String, dynamic>{'email': email, 'password': password},
      );

      Token().setToken(response.body);
    } catch (err) {
      throw Exception('SIGN IN __$err');
    }
  }

  Future<void> signUp(String firstName, String lastName, String email, String password) async {
    try {
      final response = await _service.invoke(
        path: '/auth/signup',
        method: HTTPMethod.post,
        body: <String, dynamic>{
          'name': firstName,
          'surname': lastName,
          'email': email,
          'password': password
        },
      );

      Token().setToken(response.body);
    } catch (err) {
      throw Exception('SIGN UP __$err');
    }
  }
}
