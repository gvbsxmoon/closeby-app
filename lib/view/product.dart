import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/footer.dart';
import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/components/test_carousel.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Hero(
                    tag: "carousel",
                    child: TestCarousel(
                      showIndicator: false,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                          const SizedBox(width: 8),
                          CBRoundedButton(
                            onTap: () {},
                            icon: FontAwesomeIcons.heart,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CBFooter(
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
                text: "per day",
                style: AppFonts.figtree(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        rightWidget: CBButton(
          label: 'Reserve',
          onTap: () => Get.back(),
        ),
      ),
    );
  }
}
