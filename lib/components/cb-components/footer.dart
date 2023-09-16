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
      height: 100,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColor.lightGrey, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leftWidget,
                rightWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
