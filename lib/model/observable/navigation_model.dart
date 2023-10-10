import 'package:get/get.dart';

class NavigationModel {
  final RxString _route = "/explore".obs;

  String get route => _route.value;

  set route(String value) => _route.value = value;

  NavigationModel._();

  static final NavigationModel _instance = NavigationModel._();

  factory NavigationModel() {
    return _instance;
  }
}
