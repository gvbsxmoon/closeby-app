import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/components/test_carousel.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.width * 0.75;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      shape: Border(
        bottom: BorderSide(color: AppColor.lightGrey, width: 1),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CBRoundedButton(
              onTap: () => Get.back(),
              icon: FontAwesomeIcons.chevronLeft,
            ),
            Row(
              children: [
                CBRoundedButton(
                  onTap: () {},
                  icon: FontAwesomeIcons.arrowUpFromBracket,
                ),
                const Gap(16),
                CBRoundedButton(
                  onTap: () {},
                  icon: FontAwesomeIcons.heart,
                ),
              ],
            )
          ],
        ),
      ),
      elevation: 0,
      backgroundColor: AppColor.offWhite,
      surfaceTintColor: AppColor.offWhite,
      foregroundColor: AppColor.primaryBlack,
      pinned: true,
      floating: true,
      expandedHeight: expandedHeight,
      flexibleSpace: const FlexibleSpaceBar(
        background: Hero(
          tag: "carousel",
          child: TestCarousel(
            showIndicator: false,
          ),
        ),
      ),
    );
  }
}