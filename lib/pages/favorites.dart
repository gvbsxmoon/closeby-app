import "package:closeby/components/cb-components/button.dart";
import "package:closeby/components/cb-components/snackbar.dart";
import "package:closeby/components/cb-components/wrapper.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      margin: true,
      title: 'favorites'.tr,
      subtitle: 'favorites_sub'.tr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'favorites_desc'.tr,
                style: AppFonts.figtree(
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryBlack),
              ),
            ],
          ),
          CBButton(label: 'login'.tr, expanded: true, onTap: () {})
        ],
      ),
    );
  }
}
