import "package:flutter/material.dart";
import 'package:closeby/utils/colors.dart';

class CBRoundedButton extends StatelessWidget {
  const CBRoundedButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.leftMargin = false,
  });

  final Function() onTap;
  final IconData icon;
  final bool leftMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: leftMargin ? const EdgeInsets.only(left: 24) : null,
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: AppColor.darkGrey, width: 1),
        ),
        child: Icon(
          icon,
          size: 14,
        ),
      ),
    );
  }
}
