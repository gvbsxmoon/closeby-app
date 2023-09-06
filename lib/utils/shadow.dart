import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class AppShadow {
  static List<BoxShadow> lightShadow = [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.08),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.05),
      offset: const Offset(0, 4),
      blurRadius: 12,
    ),
  ];

  static List<BoxShadow> darkShadow = [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.1),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.18),
      offset: const Offset(0, 4),
      blurRadius: 12,
    ),
  ];
}
