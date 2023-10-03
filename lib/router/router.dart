import 'package:closeby/model/observable/login_model.dart';
import 'package:closeby/view/explore.dart';
import 'package:closeby/view/favorites.dart';
import 'package:closeby/view/login.dart';
import 'package:closeby/view/product.dart';
import 'package:closeby/view/profile.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  AppRouter._();

  static List<GetPage> get routes => <GetPage>[
        GetPage(name: '/', page: () => const Explore()),
        GetPage(name: '/product', page: () => const Product()),
        GetPage(name: '/favorites', page: () => const Favorites()),
        GetPage(name: '/profile', page: () => LoginModel().isLogged ? const Profile() : Login()),
      ];

  static String get initialRoute => "/";
}
