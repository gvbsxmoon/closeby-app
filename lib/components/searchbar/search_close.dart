import "package:flutter/material.dart";
import 'package:closeby/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchClose extends StatelessWidget {
  const SearchClose({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, left: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: AppColor.darkGrey)),
          child: const Icon(
            FontAwesomeIcons.xmark,
            size: 16,
          ),
        ),
      ),
    );
  }
}
