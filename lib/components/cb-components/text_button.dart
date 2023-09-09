import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";

class CBTextButton extends StatelessWidget {
  const CBTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: AppFonts.figtree(
          color: AppColor.rebeccaPurple,
          fontSize: 12,
        ).copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
