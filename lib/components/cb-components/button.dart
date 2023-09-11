import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';

class CBButton extends StatefulWidget {
  const CBButton({
    super.key,
    required this.label,
    this.icon,
    this.expanded = false,
    this.outlined = false,
    this.appleButton = false,
    required this.onTap,
  });

  final String label;
  final IconData? icon;
  final bool expanded;
  final bool outlined;
  final bool appleButton;
  final Function() onTap;

  @override
  State<CBButton> createState() => _CBButtonState();
}

class _CBButtonState extends State<CBButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        width: widget.expanded ? double.infinity : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.outlined
              ? AppColor.offWhite
              : widget.appleButton
                  ? AppColor.primaryBlack
                  : AppColor.rebeccaPurple,
          border: Border.all(
            color: widget.outlined ? AppColor.darkGrey : widget.appleButton ? AppColor.primaryBlack : AppColor.rebeccaPurple,
            width: 2,
          ),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: widget.expanded
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  size: widget.appleButton ? 22 : 18,
                  color: widget.outlined
                      ? AppColor.rebeccaPurple
                      : AppColor.offWhite,
                ),
              if (widget.icon != null)
                const SizedBox(
                  width: 8,
                ),
              Text(
                widget.label,
                style: AppFonts.figtree(
                  color: widget.outlined
                      ? AppColor.primaryBlack
                      : AppColor.offWhite,
                ),
              ),
            ]),
      ),
    );
  }
}
