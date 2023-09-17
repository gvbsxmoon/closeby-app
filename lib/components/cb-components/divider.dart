import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class CBDivider extends StatelessWidget {
  const CBDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: Divider(
        thickness: 1,
        color: AppColor.lightGrey,
      ),
    );
  }
}
