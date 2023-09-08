import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle montserrat({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 14,
        color: color ?? AppColor.primaryBlack,
      ),
    );
  }

  static TextStyle figtree({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.figtree(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 14,
        color: color ?? AppColor.primaryBlack,
      ),
    );
  }
}
