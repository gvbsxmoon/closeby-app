import "package:closeby/components/cb-components/button.dart";
import "package:closeby/components/cb-components/wrapper.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";
import "package:get/route_manager.dart";

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      margin: true,
      title: "Favorites",
      subtitle: "Log in to view your wishlists",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You can create, view, or edit wishlists once you’ve logged in.",
                style: AppFonts.figtree(
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryBlack),
              ),
            ],
          ),
          CBButton(
              label: 'Log in',
              expanded: true,
              onTap: () => Get.toNamed('/profile'))
        ],
      ),
    );
  }
}
