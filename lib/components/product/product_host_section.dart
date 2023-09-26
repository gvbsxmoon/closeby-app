import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/* class ProductHostSection extends StatelessWidget {
  const ProductHostSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'hosted_by'.tr,
                    style: AppFonts.figtree(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'joined'.tr,
                    style: AppFonts.figtree(
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondaryBlack,
                    ),
                  ),
                ],
              ),
              ClipOval(
                child: Image.asset(
                  width: 48,
                  height: 48,
                  'assets/luca.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(FontAwesomeIcons.solidStar,
                  size: 12, color: AppColor.primaryBlack),
              const SizedBox(width: 16),
              Text(
                "3 ${'reviews'.tr}",
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(FontAwesomeIcons.shieldHeart,
                  size: 12, color: AppColor.primaryBlack),
              const SizedBox(width: 16),
              Text(
                'identity_verified'.tr,
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: DefaultTextStyle(
              style: AppFonts.figtree(
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryBlack,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('spoken_languages'.tr),
                  const SizedBox(height: 4),
                  Text('response_rate'.tr),
                  const SizedBox(height: 4),
                  Text('response_time'.tr),
                ],
              ),
            ),
          ),
          CBButton(
            expanded: true,
            outlined: true,
            label: 'contact_host'.tr,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
 */

class ProductHostSection extends StatelessWidget {
  const ProductHostSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: ShapeDecoration(
              color: AppColor.offWhite,
              shadows: AppShadow.darkShadow,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 32,
                  cornerSmoothing: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              width: 88,
                              height: 88,
                              'assets/luca.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                boxShadow: AppShadow.darkShadow,
                                color: AppColor.salmonPink,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(FontAwesomeIcons.shieldHeart,
                                size: 14, color: AppColor.offWhite),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Luca",
                        style: AppFonts.figtree(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3",
                        style: AppFonts.figtree(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Recensioni",
                        style: AppFonts.figtree(fontSize: 10),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColor.salmonPink.withOpacity(0.5),
                      ),
                      Text(
                        "6",
                        style: AppFonts.figtree(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mesi su CloseBy",
                        style: AppFonts.figtree(fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            '${'spoken_languages'.tr}English, Italian, German · ${'response_rate'.tr}100% · ${'response_time'.tr}Within 2 hours',
            textAlign: TextAlign.center,
            style: AppFonts.figtree(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.secondaryBlack,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CBButton(
            expanded: true,
            outlined: true,
            label: 'contact_host'.tr,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
