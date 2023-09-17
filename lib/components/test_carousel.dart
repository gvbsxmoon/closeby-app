import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestCarousel extends StatefulWidget {
  const TestCarousel({
    super.key,
    this.showIndicator = true,
  });

  final bool showIndicator;

  @override
  State<TestCarousel> createState() => _TestCarouselState();
}

class _TestCarouselState extends State<TestCarousel> {
  final PageController _pageController = PageController();
  int _pageCounter = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<String> arr = ["Milan", "Naples", "Rome", "Turin"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:
          widget.showIndicator ? Alignment.bottomCenter : Alignment.bottomRight,
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() {
            _pageCounter = value;
          }),
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
          widget.showIndicator
              ? Padding(
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
                )
              : Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.primaryBlack.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "${_pageCounter + 1} / ${arr.length}",
                    style: AppFonts.figtree(
                        color: AppColor.offWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
      ],
    );
  }
}
