import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
