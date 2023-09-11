import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class AppShadow {
  static List<BoxShadow> lightShadow = [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.02),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.02),
      offset: const Offset(0, 4),
      blurRadius: 6,
    ),
  ];

  /* static List<BoxShadow> darkShadow = [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.15),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.06),
      offset: const Offset(0, 4),
      blurRadius: 8,
    ),
  ]; */

  static List<BoxShadow> darkShadow = [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.06),
      offset: const Offset(0, 1),
      blurRadius: 12,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.06),
      offset: const Offset(0, 4),
      blurRadius: 16,
    ),
  ];
}
