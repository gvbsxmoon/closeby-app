import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class CBDivider extends StatelessWidget {
  const CBDivider({
    super.key,
    this.expanded = false,
    this.thin = false,
  });

  final bool expanded;
  final bool thin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: thin ? 0 : 16.0,
        horizontal: expanded ? 0 : 24.0,
      ),
      child: Divider(
        thickness: 1,
        color: AppColor.lightGrey,
      ),
    );
  }
}
