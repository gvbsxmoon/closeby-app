import "package:closeby/components/navbar.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";

class CBWrapper extends StatelessWidget {
  const CBWrapper({
    super.key,
    this.margin = false,
    this.header,
    this.title,
    this.subtitle,
    required this.child,
    this.footer,
  });

  final bool margin;
  final Widget? header;
  final String? title;
  final String? subtitle;
  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.offWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null) Padding(
              padding: const EdgeInsets.only(top: 16),
              child: header!,
            ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Text(
                  title!,
                  style: AppFonts.figtree(fontSize: 32),
                ),
              ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Text(
                  subtitle!,
                  style: AppFonts.figtree(fontSize: 24),
                ),
              ),
            Expanded(
              child: Container(
                margin:
                    margin ? const EdgeInsets.fromLTRB(24, 0, 24, 32) : null,
                child: child,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: footer ?? const Navbar(),
    );
  }
}
