import 'package:closeby/components/product/product_description.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
    required this.testDescription,
    this.isLast = false,
  });

  final String testDescription;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 24, right: isLast ? 24 : 0),
      width: MediaQuery.of(context).size.width * 0.84,
      decoration: ShapeDecoration(
        color: AppColor.lightGrey.withOpacity(0.5),
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 16,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDescription(
            testDescription: testDescription,
            limit: 120,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  width: 48,
                  height: 48,
                  'assets/luca.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Luca",
                    style: AppFonts.figtree(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "August 2023",
                    style: AppFonts.figtree(
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondaryBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
