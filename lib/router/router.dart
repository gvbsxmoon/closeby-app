import 'package:closeby/pages/explore.dart';
import 'package:closeby/pages/favorites.dart';
import 'package:closeby/pages/login.dart';
import 'package:closeby/pages/product.dart';
import 'package:closeby/pages/profile.dart';
import 'package:closeby/views/login/login_sign_in.dart';
import 'package:closeby/views/login/login_sign_up.dart';
import 'package:closeby/views/profile_personal_info.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  AppRouter._();

  static List<GetPage> get routes => <GetPage>[
        //core routes
        GetPage(name: '/explore', page: () => const Explore()),
        GetPage(name: '/product/:id', page: () => const Product()),
        GetPage(name: '/favorites', page: () => const Favorites()),
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/login', page: () => const Login()),

        //login
        GetPage(name: '/login/sign-up', page: () => const LoginSignUp()),
        GetPage(name: '/login/sign-in', page: () => const LoginSignIn()),

        //profile
        GetPage(name: '/profile/personal-info', page: () => const ProfilePersonalInfo())
      ];

  static String get initialRoute => "/explore";
}
