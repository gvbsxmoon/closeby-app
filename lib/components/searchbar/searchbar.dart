import 'package:closeby/components/searchbar/search_input.dart';
import 'package:closeby/controller/searchbar_controller.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Searchbar extends StatelessWidget {
  Searchbar({super.key});

  final SearchbarController controller = Get.put(SearchbarController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const SearchInput()),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Container(
            padding:
                const EdgeInsets.only(left: 16, right: 10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColor.lightGrey),
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppShadow.lightShadow,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      controller.model.selectedGood == 'anything'.tr
                          ? 'generic_anything'.tr
                          : controller.model.selectedGood,
                      style: AppFonts.figtree(),
                    ),
                    Text(
                      '${controller.model.selectedPlace} · ${controller.model.selectedDate}',
                      style: AppFonts.figtree(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.secondaryBlack),
                    )
                  ],
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.darkGrey, width: 1),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
