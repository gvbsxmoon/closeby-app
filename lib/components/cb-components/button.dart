import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CBButton extends StatefulWidget {
  const CBButton({
    super.key,
    required this.title,
    required this.searchIcon,
    required this.onTap,
  });

  final String title;
  final bool searchIcon;
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.rebeccaPurple,
        ),
        child: Row(children: [
          if (widget.searchIcon)
            Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 14,
              color: AppColor.offWhite,
            ),
          if (widget.searchIcon)
            const SizedBox(
              width: 8,
            ),
          Text(
            widget.title,
            style: AppFonts.figtree(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColor.offWhite),
          ),
        ]),
      ),
    );
  }
}
