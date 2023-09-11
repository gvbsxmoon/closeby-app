import "package:closeby/components/navbar.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";

class CBWrapper extends StatelessWidget {
  const CBWrapper({
    super.key,
    this.margin = false,
    this.title,
    this.subtitle,
    required this.child,
  });

  final bool margin;
  final String? title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
                child: Text(
                  title!,
                  style: AppFonts.figtree(fontSize: 32),
                ),
              ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                child: Text(
                  subtitle!,
                  style: AppFonts.figtree(fontSize: 24),
                ),
              ),
            Expanded(
              child: Container(
                margin: margin
                    ? const EdgeInsets.symmetric(horizontal: 20)
                    : null,
                child: child,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
