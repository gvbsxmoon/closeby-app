import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Future<dynamic> showCBBottomModal(
    BuildContext context, String description) async {
  return showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    backgroundColor: AppColor.offWhite,
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
                  child: Text('what_more'.tr,
                      style: AppFonts.figtree(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
                  child: Text(description),
                ),
              ],
            ),
          ),
          Positioned(
            top: .0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: AppColor.offWhite,
                border: Border(
                  bottom: BorderSide(color: AppColor.lightGrey, width: 1),
                ),
              ),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  FontAwesomeIcons.xmark,
                  size: 18,
                  color: AppColor.primaryBlack,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
