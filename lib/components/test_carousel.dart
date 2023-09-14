import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestCarousel extends StatelessWidget {
  TestCarousel({super.key});

  final PageController _pageController = PageController();

  final List<String> arr = ["Milan", "Naples", "Rome", "Turin"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: _pageController,
          children: arr
              .map<Widget>(
                (k) => Image(
                  image: AssetImage("assets/places/$k.png"),
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
        if (arr.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: arr.length,
              effect: WormEffect(
                dotColor: AppColor.offWhite.withOpacity(0.5),
                activeDotColor: AppColor.offWhite,
                dotHeight: 6,
                dotWidth: 6,
                spacing: 6,
                type: WormType.thin,
              ),
            ),
          ),
      ],
    );
  }
}
