import 'dart:ui';

Color hexToColor(String code) {
  return Color(int.parse(code, radix: 16) + 0xFF000000);
}

class AppColor {
  AppColor._();

  //primary
  static Color get rebeccaPurple => hexToColor("4C4CF6");
  static Color get midRebeccaPurple => hexToColor("7D7DF8");
  static Color get lightRebeccaPurple => hexToColor("ABABFB");

  //secondary
  static Color get lightSalmonPink => hexToColor("FF9577");
  static Color get salmonPink => hexToColor("EC7553");

  //unused
  /* static Color get babyBlue => hexToColor("BBE4E7");
  static Color get bananaYellow => hexToColor("F8D576"); */

  //grey scale
  static Color get primaryBlack => hexToColor("1F1F1F");
  static Color get secondaryBlack => hexToColor("717171");
  static Color get offWhite => hexToColor("FAFAFA");
  static Color get lightGrey => hexToColor("E9E9E9");
  static Color get darkGrey => hexToColor("D1D1D1");
}
