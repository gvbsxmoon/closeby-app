import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';

class CBCard extends StatefulWidget {
  const CBCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.asset,
  });

  @override
  State<CBCard> createState() => _CBCardState();

  final bool isSelected;
  final String title;
  final String asset;
}

class _CBCardState extends State<CBCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ColorFiltered(
                colorFilter: widget.isSelected
                    ? const ColorFilter.mode(
                        Colors.transparent, BlendMode.color)
                    : ColorFilter.mode(
                        AppColor.lightGrey,
                        BlendMode.saturation,
                      ),
                child: Image.asset(
                  widget.asset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(
            widget.title,
            style: AppFonts.figtree(fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
