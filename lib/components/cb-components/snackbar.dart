import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showCBSnackbar(
  BuildContext context,
  String text,
) {
  final snackBar = SnackBar(
    backgroundColor: AppColor.primaryBlack,
    duration: const Duration(days: 365),
    showCloseIcon: true,
    content: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Icon(
              FontAwesomeIcons.circleExclamation,
              color: AppColor.salmonPink,
              size: 14,
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We're so sorry!",
                  style: AppFonts.figtree(color: AppColor.salmonPink),
                ),
                Text(
                  text,
                  style: AppFonts.figtree(
                    color: AppColor.offWhite,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
