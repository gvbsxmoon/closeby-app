import "package:closeby/components/cb-components/button.dart";
import "package:closeby/components/cb-components/wrapper.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      margin: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Favorites",
                style: AppFonts.figtree(fontSize: 32),
              ),
              const SizedBox(height: 32),
              Text(
                "Log in to view your wishlists",
                style: AppFonts.figtree(fontSize: 24),
              ),
              const SizedBox(height: 12),
              Text(
                "You can create, view, or edit wishlists once you’ve logged in.",
                style: AppFonts.figtree(
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryBlack),
              ),
            ],
          ),
          CBButton(label: 'Log In', expanded: true, onTap: () {})
        ],
      ),
    );
  }
}
