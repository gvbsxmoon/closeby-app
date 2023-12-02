import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_buttons.dart';
import 'package:closeby/components/login/login_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLogInScreen();
  }

  CBWrapper _buildLogInScreen() {
    return CBWrapper(
      title: 'profile'.tr,
      subtitle: 'profile_sub'.tr,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 48),
            child: LoginCard(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LoginSignServiceButtons(),
          ),
        ],
      ),
    );
  }
}
