import "package:flutter/material.dart";

class CBWrapper extends StatelessWidget {
  const CBWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: child,
    );
  }
}
