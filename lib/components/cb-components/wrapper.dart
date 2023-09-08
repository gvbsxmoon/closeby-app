import "package:closeby/components/navbar.dart";
import "package:closeby/utils/colors.dart";
import "package:flutter/material.dart";

class CBWrapper extends StatelessWidget {
  const CBWrapper({
    super.key,
    this.margin = false,
    required this.child,
  });

  final bool margin;
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
          child: child,
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
