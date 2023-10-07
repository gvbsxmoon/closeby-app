import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_sign_in.dart';
import 'package:closeby/components/login/login_sign_up.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/mixins.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with FormValidator, StringUtils {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      header: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Center(
            child: Text(
              'email_button'.tr,
              style: AppFonts.figtree(fontSize: 14),
            ),
          ),
          CBRoundedButton(
            leftMargin: true,
            onTap: () => Get.back(),
            icon: FontAwesomeIcons.chevronLeft,
          )
        ],
      ),
      footer: const SizedBox(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            /* LoginSignIn(controller: widget.controller), */
            LoginSignUp(controller: widget.controller),
          ],
        ),
      ),
    );
  }

}
