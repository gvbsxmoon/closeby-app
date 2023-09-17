import 'package:closeby/components/product/product_review_card.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({
    super.key,
    required this.testDescription,
  });

  final String testDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.solidStar,
                  size: 14, color: AppColor.primaryBlack),
              const SizedBox(width: 8),
              Text(
                "4.96 · 3 reviews",
                style: AppFonts.figtree(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 205,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: [0, 1, 2].length,
            itemBuilder: (context, index) {
              return ProductReviewCard(
                testDescription: testDescription,
                isLast: index == 2,
              );
            },
          ),
        ),
      ],
    );
  }
}