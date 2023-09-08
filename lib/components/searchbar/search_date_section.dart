import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';

class SearchDateSection extends StatelessWidget {
  const SearchDateSection({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppShadow.lightShadow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.lightGrey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: AppFonts.figtree(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColor.darkGrey),
                  ),
                  if (selected.isNotEmpty)
                    Text(
                      selected,
                      style: AppFonts.figtree(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColor.primaryBlack),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
