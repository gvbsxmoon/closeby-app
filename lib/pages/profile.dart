import 'package:closeby/components/cb-components/divider.dart';
import 'package:closeby/components/cb-components/text_button.dart';
import 'package:closeby/components/cb-components/user_card.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/model/observable/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      margin: true,
      title: 'profile'.tr,
      rightAppbarAction: CBTextButton(
        label: 'edit'.tr,
        onPressed: () {},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const CBUserCard(),
          const SizedBox(
            height: 32,
          ),
          CBTextButton(
            onPressed: () {
              LoginModel().isLogged = false;
              Get.offNamed('/login');
            },
            label: "Logout",
          )
        ],
      ),
    );
  }
}
