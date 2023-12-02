import 'package:closeby/components/cb-components/bottom_modal.dart';
import 'package:closeby/components/cb-components/text_button.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.testDescription,
    this.limit = 180,
  });

  final String testDescription;
  final int limit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${testDescription.substring(0, limit)}...",
          style: AppFonts.figtree(
            fontWeight: FontWeight.w300,
          ).copyWith(
            height: 1.5,
          ),
        ),
        if (testDescription.length > limit)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CBTextButton(
              onPressed: () async =>
                  await showCBBottomModal(context, testDescription),
              label: 'show_more'.tr,
            ),
          ),
      ],
    );
  }
}
