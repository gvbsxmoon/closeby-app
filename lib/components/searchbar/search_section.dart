import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.title,
    required this.selected,
    required this.child,
    required this.isExpanded,
    required this.onTap,
  });

  final String title;
  final String selected;
  final Widget child;
  final bool isExpanded;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isExpanded
          ? null
          : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: isExpanded ? 20 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: isExpanded ? AppShadow.darkShadow : AppShadow.lightShadow,
          borderRadius: BorderRadius.circular(isExpanded ? 24 : 16),
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
                          fontSize: isExpanded ? 24 : 14,
                          color: isExpanded
                              ? AppColor.primaryBlack
                              : AppColor.darkGrey),
                    ),
                    if (!isExpanded && selected.isNotEmpty)
                      Text(
                        selected,
                        style: AppFonts.figtree(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryBlack),
                      ),
                  ],
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves
                    .easeInOut, // Puoi personalizzare la curva dell'animazione
                child: isExpanded
                    ? const SizedBox(
                        height: 24,
                      )
                    : const SizedBox(), // Widget condizionale da animare
              ),
              if (isExpanded)
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: const SizedBox(), // Widget quando non espanso
                  secondChild: child, // Widget quando espanso
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
            ]),
      ),
    );
  }
}
