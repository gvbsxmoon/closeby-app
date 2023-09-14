import 'package:closeby/view/explore.dart';
import 'package:closeby/view/favorites.dart';
import 'package:closeby/view/login.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  static List<GetPage> get routes => <GetPage>[
        GetPage(name: '/', page: () => const Explore()),
        GetPage(name: '/favorites', page: () => const Favorites()),
        GetPage(name: '/profile', page: () => const Login())
      ];

  static String get initialRoute => "/";
}
