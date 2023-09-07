import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({
    super.key,
    required this.title,
    required this.selected,
    required this.child,
    required this.isExpanded,
    required this.callback,
  });

  final String title;
  final String selected;
  final Widget child;
  final bool isExpanded;
  final Function() callback;

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isExpanded
          ? null
          : () {
              widget.callback();
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: widget.isExpanded ? 20 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:
              widget.isExpanded ? AppShadow.darkShadow : AppShadow.lightShadow,
          borderRadius: BorderRadius.circular(widget.isExpanded ? 24 : 16),
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
                      widget.title,
                      textAlign: TextAlign.left,
                      style: AppFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: widget.isExpanded ? 24 : 16,
                          color: widget.isExpanded
                              ? AppColor.primaryBlack
                              : AppColor.darkGrey),
                    ),
                    if (!widget.isExpanded && widget.selected.isNotEmpty)
                      Text(
                        widget.selected,
                        style: AppFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColor.primaryBlack),
                      ),
                  ],
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves
                    .easeInOut, // Puoi personalizzare la curva dell'animazione
                child: widget.isExpanded
                    ? const SizedBox(
                        height: 24,
                      )
                    : const SizedBox(), // Widget condizionale da animare
              ),
              if (widget.isExpanded)
                /* AnimatedOpacity(
                  opacity: widget.isExpanded ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: widget.child,
                ), */
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: const SizedBox(), // Widget quando non espanso
                secondChild: widget.child, // Widget quando espanso
                crossFadeState: widget.isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
              ),
            ]),
      ),
    );
  }
}