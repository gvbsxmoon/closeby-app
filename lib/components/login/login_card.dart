import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadow.darkShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Get into CloseBy', style: AppFonts.figtree()),
            const SizedBox(height: 4),
            Text(
              "It's simple to get set up",
              style: AppFonts.figtree(
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryBlack,
              ),
            ),
            Text(
              "and start earning.",
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
