import 'package:closeby/model/observable/login_model.dart';
import 'package:closeby/utils/service.dart';
import 'package:closeby/utils/token.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class LoginController extends GetxController {
  LoginModel model = LoginModel();
  final service = AppService();

  Future<bool> checkEmail(String email) async {
    try {
      final res = await service.invoke(path: '/auth/check/$email');

      return res.statusCode == 409;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final response = await service.invoke(
        path: '/auth/signin',
        method: HTTPMethod.post,
        body: <String, dynamic>{'email': email, 'password': password},
      );

      Token().setToken(response.body);

      /* model.isLogged = true;
      Get.toNamed('/explore'); */
    } catch (err) {
      throw Exception('SIGN IN __$err');
    }
  }

  Future<void> signUp(
      String firstName, String lastName, String email, String password) async {
    try {
      final response = await service.invoke(
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

      /* model.isLogged = true;
      Get.toNamed('/explore'); */
    } catch (err) {
      throw Exception('SIGN UP __$err');
    }
  }
}
