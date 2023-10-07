import 'package:closeby/pages/explore.dart';
import 'package:closeby/pages/favorites.dart';
import 'package:closeby/pages/login.dart';
import 'package:closeby/pages/product.dart';
import 'package:closeby/pages/profile.dart';
import 'package:closeby/views/login_sign_in.dart';
import 'package:closeby/views/login_sign_up.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  AppRouter._();

  static List<GetPage> get routes => <GetPage>[
        //core routes
        GetPage(name: '/', page: () => const Explore()),
        GetPage(name: '/product/:id', page: () => const Product()),
        GetPage(name: '/favorites', page: () => const Favorites()),
        GetPage(name: '/profile', page: () => const Profile()),
        GetPage(name: '/login', page: () => const Login()),

        //view routes
        GetPage(name: '/login/signup', page: () => const LoginSignUp()),
        GetPage(name: '/login/signin', page: () => const LoginSignIn()),
      ];

  static String get initialRoute => "/";
}
