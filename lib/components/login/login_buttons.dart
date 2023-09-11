import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/login/login_form.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginSignServiceButtons extends StatelessWidget {
  const LoginSignServiceButtons({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CBButton(
            expanded: true,
            appleButton: true,
            icon: FontAwesomeIcons.apple,
            label: "Continue with Apple",
            onTap: () {}),
        const SizedBox(height: 16),
        CBButton(
            expanded: true,
            outlined: true,
            icon: FontAwesomeIcons.google,
            label: "Continue with Google",
            onTap: () {}),
        const SizedBox(height: 16),
        CBButton(
            expanded: true,
            outlined: true,
            icon: FontAwesomeIcons.envelope,
            label: "Continue with email",
            onTap: () async {
              await LoginForm(
                controller: controller,
              ).launch(context);
            }),
      ],
    );
  }
}
