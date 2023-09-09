import 'package:closeby/components/cb-components/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSignServiceButtons extends StatelessWidget {
  const ProfileSignServiceButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CBButton(
            expanded: true,
            appleButton: true,
            icon: FontAwesomeIcons.apple,
            label: "Continue with Apple",
            onTap: () {}),
        const SizedBox(height: 16),
        CBButton(
            expanded: true,
            outlined: true,
            icon: FontAwesomeIcons.google,
            label: "Continue with Google",
            onTap: () {}),
      ],
    );
  }
}