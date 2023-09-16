import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class AppShadow {
  AppShadow._();
  
  static List<BoxShadow> get lightShadow => [
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

  static List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.04),
      offset: const Offset(0, 1),
      blurRadius: 12,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(0.04),
      offset: const Offset(0, 2),
      blurRadius: 16,
    ),
  ];

  static List<BoxShadow> get bottomMediumShadow => [
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(1),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: AppColor.primaryBlack.withOpacity(1),
      offset: const Offset(0, 2),
      blurRadius: 6,
    ),
  ];

  static List<BoxShadow> get darkShadow => [
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
