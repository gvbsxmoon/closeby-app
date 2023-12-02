import 'package:closeby/components/cb-components/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginSignServiceButtons extends StatelessWidget {
  const LoginSignServiceButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CBButton(
            expanded: true,
            appleButton: true,
            icon: FontAwesomeIcons.apple,
            label: "apple_button".tr,
            onTap: () {}),
        const SizedBox(height: 16),
        CBButton(
            expanded: true,
            outlined: true,
            icon: FontAwesomeIcons.google,
            label: "google_button".tr,
            onTap: () {}),
        const SizedBox(height: 16),
        CBButton(
          expanded: true,
          outlined: true,
          icon: FontAwesomeIcons.envelope,
          label: "email_button".tr,
          onTap: () => Get.toNamed('/login/sign-in'),
        ),
      ],
    );
  }
}
