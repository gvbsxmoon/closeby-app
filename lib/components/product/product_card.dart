import 'package:closeby/components/test_carousel.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed("/product/531"),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: AppColor.lightGrey,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 24,
                      cornerSmoothing: 1,
                    ),
                  ),
                ),
                child: const AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Hero(
                    tag: "carousel",
                    child: TestCarousel(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(
                    true ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                    color: true ? AppColor.salmonPink : AppColor.offWhite,
                    shadows: AppShadow.mediumShadow,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Milan, MI",
              style: AppFonts.figtree(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.solidStar,
                    size: 10, color: AppColor.primaryBlack),
                const Gap(4),
                Text(
                  "4.96",
                  style: AppFonts.figtree(fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        const Gap(4),
        Text(
          "Garage",
          style: AppFonts.figtree(
            fontWeight: FontWeight.w400,
            color: AppColor.secondaryBlack,
          ),
        ),
        const Gap(4),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "€ 720 ",
                style: AppFonts.figtree(),
              ),
              TextSpan(
                text: 'per_day'.tr,
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
