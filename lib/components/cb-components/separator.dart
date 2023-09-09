import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';

class CBSeparator extends StatelessWidget {
  const CBSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.darkGrey,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'or',
            style: AppFonts.figtree(color: AppColor.darkGrey),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.darkGrey,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}