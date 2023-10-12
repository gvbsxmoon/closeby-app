import 'package:closeby/components/cb-components/list.dart';
import 'package:closeby/components/cb-components/text_button.dart';
import 'package:closeby/components/cb-components/user_card.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/profile/list_options.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:closeby/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final NavigationController _controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      title: 'profile'.tr,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
              child: CBUserCard(),
            ),
            CBList(
              listTitle: "Settings",
              listOptions: settingsListOptions,
            ),
            CBList(
              listTitle: "Help",
              listOptions: helpListOptions,
            ),
            CBList(
              listTitle: "Legal",
              listOptions: legalListOptions,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
              child: CBTextButton(
                onPressed: () => _controller.navigate(route: "/explore"),
                label: "Logout",
              ),
            )
          ],
        ),
      ),
    );
  }
}
