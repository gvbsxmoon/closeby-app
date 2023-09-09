import "package:closeby/components/navbar.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";

class CBWrapper extends StatelessWidget {
  const CBWrapper({
    super.key,
    this.margin = false,
    this.title,
    required this.child,
  });

  final bool margin;
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhite,
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: margin
              ? const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    title!,
                    style: AppFonts.figtree(fontSize: 32),
                  ),
                ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
