import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductHostSection extends StatelessWidget {
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
