import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    "This place is hosted by Luca",
                    style: AppFonts.figtree(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Joined in 2019",
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
                "3 reviews",
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
                "Identity verified",
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Languages: English, Italian"),
                  SizedBox(height: 4),
                  Text("Response rate: 100%"),
                  SizedBox(height: 4),
                  Text("Response time: within an hour"),
                ],
              ),
            ),
          ),
          CBButton(
            expanded: true,
            outlined: true,
            label: "Contact host",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}