import 'package:flutter/material.dart';

class AppColors {
  static const blackColor = Colors.black;
  static const grey = Color(0XFF7E8091);
  static const primaryColor = Color(0XFF171B30);
  static const scaffoldLightColor = Color(0xFFEBF2F7);
  static const scaffoldDarkColor = Color(0xFF1B2236);
  static const boddyBackGroundColor = Color(0XFF171B30);
  static const cardDarkColor = Color(0xFF2A2E35);

  static const textPrimaryColor = Color(0xFF2E3033);
  static const textSecondaryColor = Color(0xFF757575);
  static const viewLineColor = Color(0xFFEAEAEA);
  static const errorColor = Color(0xFFFF6347);
  static const transparentColor = Color(0x00000000);
  static const buttomColor = Color.fromARGB(239, 73, 200, 87);
  static const red = Color(0xFFE30000);
  static const pink = Color(0xFFBF046B);
  static const yeloow = Color(0xFFF2BC17);
  static const green = Color(0xFF238C2A);
  static const orange = Color(0xFFF26101);
  static const blue = Color(0xFF0420BF);
  static const purple = Color(0xFF520661);

  static const whiteColor = Colors.white;
  Color shadowColorGlobal = Colors.grey.withOpacity(0.4);
  Color appBarBackgroundColorGlobal = Colors.white;
  Color appButtonBackgroundColorGlobal = Colors.white;
  Color getColorFromHex(String hexColor, {Color? defaultColor}) {
    if (hexColor.isEmpty) {
      if (defaultColor != null) {
        return defaultColor;
      } else {
        throw ArgumentError('Can not parse provided hex $hexColor');
      }
    }

    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
