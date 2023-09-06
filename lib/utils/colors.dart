import 'dart:ui';

Color hexToColor(String code) {
  return Color(int.parse(code, radix: 16) + 0xFF000000);
}

class AppColor {
  static final Color rebeccaPurple = hexToColor("4C4CF6");
  static final Color salmonPink = hexToColor("FF9577");
  static final Color babyBlue = hexToColor("BBE4E7");
  static final Color bananaYellow = hexToColor("F8D576");
  static final Color primaryBlack = hexToColor("1F1F1F");
  static final Color secondaryBlack = hexToColor("717171");
  static final Color offWhite = hexToColor("FAFAFA");
  static final Color lightGrey = hexToColor("E9E9E9");
  static final Color darkGrey = hexToColor("D1D1D1");
}