import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/controller/navigation_controller.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesGuest extends StatelessWidget {
  FavoritesGuest({super.key});

  final NavigationController _controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'favorites_desc'.tr,
              style: AppFonts.figtree(
                  fontWeight: FontWeight.w400, color: AppColor.secondaryBlack),
            ),
          ],
        ),
        CBButton(
          label: 'login'.tr,
          expanded: true,
          onTap: () => _controller.navigate(route: '/login'),
        )
      ],
    );
  }
}
