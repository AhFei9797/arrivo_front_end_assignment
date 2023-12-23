import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

enum TextFamily { Regular, Light, Bold }

class TextStyleConfig {
  static TextStyle getTextStyle({TextFamily? textFamily, double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConfig.primaryTextColor,
      fontFamily: textFamily == TextFamily.Regular
          ? 'HNRegular'
          : textFamily == TextFamily.Light
              ? 'HNLight'
              : 'HNBold',
    );
  }

  static TextStyle regularTextStyle({double? fontSize, Color? color, TextDecoration? textDecoration, FontStyle? fontStyle, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConfig.primaryTextColor,
      decoration: textDecoration,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontFamily: 'Lato-Regular',
    );
  }

  static TextStyle lightTextStyle({double? fontSize, Color? color, TextDecoration? textDecoration, FontStyle? fontStyle}) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConfig.primaryTextColor,
      decoration: textDecoration,
      fontStyle: fontStyle,
      fontFamily: 'Lato-Light',
    );
  }

  static TextStyle boldTextStyle({double? fontSize, Color? color, TextDecoration? textDecoration, FontStyle? fontStyle}) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConfig.primaryTextColor,
      decoration: textDecoration,
      fontStyle: fontStyle,
      fontWeight: FontWeight.bold,
      // fontFamily: 'Lato-Bold',
    );
  }

  static TextStyle mediumTextStyle({double? fontSize, Color? color, TextDecoration? textDecoration, FontStyle? fontStyle}) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConfig.primaryTextColor,
      decoration: textDecoration,
      fontStyle: fontStyle,
      fontFamily: 'HNMedium',
    );
  }

  static TextStyle underlineTextStyle({double? fontSize, double? spacing, double? thickness}) {
    return TextStyle(
      shadows: [
        Shadow(
          color: Colors.white,
          offset: Offset(0, -spacing!),
        ),
      ],
      fontSize: fontSize ?? 14,
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      decorationThickness: thickness,
      fontFamily: 'HNBold',
    );
  }

  static TextStyle titleTextStyle() {
    return const TextStyle(
      fontSize: 16.0,
      color: ColorConfig.primaryColor,
      fontFamily: 'HNBold',
    );
  }
}

class BottomSheetConfig {
  static ShapeBorder bottomSheetShapeBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0.w),
        topRight: Radius.circular(16.0.w),
      ),
    );
  }
}
