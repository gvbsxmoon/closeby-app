import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class CBDivider extends StatelessWidget {
  const CBDivider({
    super.key,
    this.expanded = false,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 16.0, horizontal: expanded ? 0 : 24.0),
      child: Divider(
        thickness: 1,
        color: AppColor.lightGrey,
      ),
    );
  }
}
