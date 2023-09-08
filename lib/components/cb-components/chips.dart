import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';

class CBChips extends StatefulWidget {
  const CBChips({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;

  @override
  State<CBChips> createState() => _CBChipsState();
}

class _CBChipsState extends State<CBChips> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: widget.isSelected ? AppColor.primaryBlack : AppColor.offWhite,
        border: Border.all(
          color: widget.isSelected ? AppColor.primaryBlack : AppColor.darkGrey,
        ),
      ),
      child: Text(
        widget.title,
        style: AppFonts.figtree(
          color: widget.isSelected ? AppColor.offWhite : AppColor.primaryBlack,
        ),
      ),
    );
  }
}
