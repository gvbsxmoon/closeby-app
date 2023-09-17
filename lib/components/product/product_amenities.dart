import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductAmenities extends StatelessWidget {
  const ProductAmenities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What this place offer",
            style: AppFonts.figtree(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(FontAwesomeIcons.weightHanging,
                  size: 18, color: AppColor.primaryBlack),
              const SizedBox(width: 16),
              Text(
                "Heavy lifting",
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(FontAwesomeIcons.box,
                  size: 18, color: AppColor.primaryBlack),
              const SizedBox(width: 16),
              Text(
                "Package",
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(FontAwesomeIcons.tornado,
                  size: 18, color: AppColor.primaryBlack),
              const SizedBox(width: 16),
              Text(
                "Empty cellars",
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(FontAwesomeIcons.shower,
                  size: 18, color: AppColor.primaryBlack),
              const SizedBox(width: 16),
              Text(
                "Pre-rent cleaning",
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}