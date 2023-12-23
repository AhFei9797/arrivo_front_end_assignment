import 'package:flutter/material.dart';

class ColorConfig {
  static const _primaryValue = 0xFF0D97DA;
  static const primaryColor = Color(0xFFA0C5FF);
  static const accentColor = Color(0xFF418BF5);
  static const secondaryColor = Color(0xFF0D8FD6);
  static const backgroundColor = Color(0xFFF4F5F8);
  static const grayBackgroundColor = Color(0XFFF0EEEE);
  static const liteGrayBackgroundColor = Color(0XFFFBFBFB);

  static const themeDarkBlue = Color(0xFF252965);
  static const themeBlue = Color(0xFF0D9FDE);
  static const themeYellow = Color(0xFFFAC832);
  static const themeRed = Color(0xFFE26F59);
  static const themeGray = Color(0xFFF3F3F3);
  static const themeLightGray = Color(0xFFF8F8F8);
  static const themeGreen = Color(0xFF1AB50D);
  static const themeLightBlue = Color(0xFFBDCDE1);
  static const themeOrange = Color(0xFFF6A000);
  static const themeLightOrange = Color(0xFFFDD08F);
  static const themeGradientStart = Color(0xFF0D66C2);
  static const themeGradientEnd = Color(0xFF0DA3E0);
  static const themePurple = Color(0xFF556DED);
  static const themeLightPurple = Color(0xFF98A8FF);
  static const themeGradientLightBlue = Color(0xFFC2E8FC);
  static const themeGradientBlue = Color(0xFF19B2FF);
  static const themeGradientLightPurple = Color(0xFFC1CBFF);
  static const themeGradientPurple = Color(0xFF4A66FF);
  static const themeGradientLightGreen = Color(0xFFF5FFF7);
  static const themeGradientGreen = Color(0xFF27DB51);
  static const themeGradientLightCyan = Color(0xFFCEEFFF);
  static const themeGradientCyan = Color(0xFF2ACCEA);
  static const themeGradientLightOrange = Color(0xFFFDF7F5);
  static const themeGradientOrange = Color(0xFFFF7846);
  static const themeCardLightBlue = Color(0xFFE8F8FF);
  static const themeBackgroundLightGrey = Color(0xFFFAFAFA);
  static const themeBackgroundGrey = Color(0xFFE8E8E8);
  static const themeBackgroundDarkGrey = Color(0xFF707180);
  static const themeBackgroundBlue = Color(0xFF60B5FD);
  static const themeActiveGreen = Color(0xFF359602);
  static const themeErrorRed = Color(0xFFEB2020);

  static const primaryTextColor = Colors.black;
  static const subTextColor = Color(0xFF666666);
  static const grayTextColor = Color(0XFF868686);
  static const menuTextColor = Color(0XFF616161);
  static const shadowColor = Color(0x1E3B3B3B);
  static const badgeRedColor = Color(0xFFED1C24);
  static const chatBlueColor = Color(0xFF0087DC);

  static const dividerGrayColor = Color(0xFFCCCCCC);
  static const darkGrayColor = Color(0xFF404040);
  static const disabledColor = Color(0xFFeaeaea);
  static const unselectedWidgetColor = Color(0xFFbbbbbb);
  static const unselectedPanelColor = Color(0xFFdcdcdc);

  // Tier
  static const tierBronzeColor = Color(0xFFA96A48);
  static const tierSilverColor = Color(0xFF5D5E5F);
  static const tierGoldColor = Color(0xFF917048);
  static const tierDiamondColor = Color(0xFF4F5564);

  static final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );

  static const MaterialColor appMaterialColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
