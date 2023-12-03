import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_buttons.dart';
import 'package:closeby/components/login/login_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LoginCard(),
          ),
          Gap(48),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LoginSignServiceButtons(),
          ),
        ],
      ),
    );
  }
}
