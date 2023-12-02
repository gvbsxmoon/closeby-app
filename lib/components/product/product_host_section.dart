import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/user_card.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          const CBUserCard(),
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
