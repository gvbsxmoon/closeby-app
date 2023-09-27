import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: ShapeDecoration(
        color: AppColor.offWhite,
        shadows: AppShadow.darkShadow,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 16,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('profile_card_title'.tr, style: AppFonts.figtree()),
            const SizedBox(height: 4),
            Text(
              'profile_card_desc1'.tr,
              style: AppFonts.figtree(
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryBlack,
              ),
            ),
            Text(
              'profile_card_desc2'.tr,
              style: AppFonts.figtree(
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryBlack,
              ),
            ),
          ],
        ),
        SvgPicture.asset('assets/illustrations/hologram.svg', width: 80)
      ]),
    );
  }
}
