import 'dart:ui';

Color hexToColor(String code) {
  return Color(int.parse(code, radix: 16) + 0xFF000000);
}

class AppColor {
  static Color get rebeccaPurple => hexToColor("4C4CF6");
  static Color get salmonPink => hexToColor("FF9577");
  static Color get babyBlue => hexToColor("BBE4E7");
  static Color get bananaYellow => hexToColor("F8D576");
  static Color get primaryBlack => hexToColor("1F1F1F");
  static Color get secondaryBlack => hexToColor("717171");
  static Color get offWhite => hexToColor("FAFAFA");
  static Color get lightGrey => hexToColor("E9E9E9");
  static Color get darkGrey => hexToColor("D1D1D1");
}