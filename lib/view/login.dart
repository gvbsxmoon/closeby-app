import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_buttons.dart';
import 'package:closeby/components/login/login_card.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return controller.model.isLogged
        ? _buildProfileScreen()
        : _buildLogInScreen();
  }

  CBWrapper _buildLogInScreen() {
    return CBWrapper(
      title: 'profile'.tr,
      subtitle: 'profile_sub'.tr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 48),
            child: LoginCard(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LoginSignServiceButtons(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  CBWrapper _buildProfileScreen() {
    return CBWrapper(
      title: 'profile'.tr,
      child: const Text('correctly logged in'),
    );
  }
}
