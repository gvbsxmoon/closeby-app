import 'package:closeby/components/searchbar/searchbar.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 8, 24, 0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                height: 24,
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Close",
                      style: AppFonts.figtree(
                          color: AppColor.lightRebeccaPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "By",
                      style: AppFonts.figtree(
                          color: AppColor.rebeccaPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Searchbar(),
      ],
    );
  }
}
