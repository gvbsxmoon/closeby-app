import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/divider.dart';
import 'package:closeby/components/cb-navigation/footer.dart';
import 'package:closeby/components/product/product_amenities.dart';
import 'package:closeby/components/product/product_description.dart';
import 'package:closeby/components/product/product_header.dart';
import 'package:closeby/components/product/product_host_section.dart';
import 'package:closeby/components/product/product_reviews.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  final String _testDescription =
      "Curabitur ac augue sit amet elit pellentesque aliquet venenatis sed risus. Vivamus accumsan tortor ut urna tristique porttitor. Proin vulputate at eros consequat aliquet. Mauris eget rhoncus turpis. Phasellus euismod laoreet sem, et ultricies arcu blandit nec. Ut fringilla erat nisi. Phasellus sed nunc ac elit ultrices varius vitae non nulla. Ut tristique dapibus justo, id euismod enim eleifend hendrerit.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          const ProductHeader(),
        ],
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            ..._buildProductHero(),
            const CBDivider(),
            const ProductHostSection(),
            const CBDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ProductDescription(testDescription: _testDescription),
            ),
            const CBDivider(),
            const ProductAmenities(),
            const CBDivider(),
            ProductReviews(testDescription: _testDescription),
            const CBDivider(),
            _buildSecurityPolicy()
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: _buildProductFooter()),
    );
  }

  CBFooter _buildProductFooter() {
    return CBFooter(
      leftWidget: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "€ 720 ",
              style: AppFonts.figtree(
                fontSize: 18,
              ),
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
      rightWidget: CBButton(
        label: 'reserve'.tr,
        onTap: () => Get.back(),
      ),
    );
  }

  List<Widget> _buildProductHero() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Text(
          "Spacious garage in City Life area",
          style: AppFonts.figtree(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Milan, MI",
              style: AppFonts.figtree(
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.solidStar,
                  size: 10,
                  color: AppColor.primaryBlack,
                ),
                const SizedBox(width: 4),
                Text(
                  "4.96",
                  style: AppFonts.figtree(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  Padding _buildSecurityPolicy() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'safety_banner1'.tr,
              style: AppFonts.figtree(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryBlack),
            ),
            TextSpan(
              text: "CloseBy",
              style:
                  AppFonts.figtree(fontSize: 12, color: AppColor.rebeccaPurple),
            ),
            TextSpan(
                text: 'safety_banner2'.tr,
                style: AppFonts.figtree(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryBlack)),
          ],
        ),
      ),
    );
  }
}
