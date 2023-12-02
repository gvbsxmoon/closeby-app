import "package:closeby/components/cb-components/wrapper.dart";
import "package:closeby/model/observable/login_model.dart";
import 'package:closeby/views/favorites/favorites_guest.dart';
import "package:closeby/views/favorites/favorites_logged.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      margin: true,
      title: 'favorites'.tr,
      subtitle: 'favorites_sub'.tr,
      child: LoginModel().isLogged ? FavoritesLogged() : FavoritesGuest(),
    );
  }
}
