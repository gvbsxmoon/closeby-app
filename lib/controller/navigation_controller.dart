import 'package:closeby/model/observable/navigation_model.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final NavigationModel model = NavigationModel();

  void navigate({required String route, bool cleanHistory = false}) {
    model.route = route;
    cleanHistory ? Get.offNamed(route) : Get.toNamed(route);
  }
}
