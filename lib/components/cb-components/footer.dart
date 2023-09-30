import "package:closeby/utils/colors.dart";
import "package:flutter/material.dart";

class CBFooter extends StatelessWidget {
  const CBFooter({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
  });
  final Widget leftWidget;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        border: Border(top: BorderSide(color: AppColor.lightGrey, width: 1)),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftWidget,
            rightWidget,
          ],
        ),
      ),
    );
  }
}
