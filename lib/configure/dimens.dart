import 'dart:html';

class DimenConfig {
  static double size_1 = 1.0;
  static double size_2 = 2.0;
  static double size_3 = 3.0;
  static double size_4 = 4.0;
  static double size_5 = 5.0;
  static double size_6 = 6.0;
  static double size_7 = 7.0;
  static double size_8 = 8.0;
  static double size_9 = 9.0;
  static double size_10 = 10.0;
  static double size_11 = 11.0;
  static double size_12 = 12.0;
  static double size_13 = 13.0;
  static double size_14 = 14.0;
  static double size_15 = 15.0;

  static double size_16 = 16.0;
  static double size_18 = 18.0;
  static double size_20 = 20.0;
  static double size_24 = 24.0;
  static double size_25 = 25.0;
  static double size_28 = 28.0;
  static double size_30 = 30.0;
  static double size_32 = 32.0;
  static double size_34 = 34.0;
  static double size_36 = 36.0;
  static double size_40 = 40.0;
  static double size_44 = 44.0;
  static double size_48 = 48.0;
  static double size_64 = 64.0;

  static double standardSize = 24.0;

  static double standardTextSize = 16.0;
  static double textSize_8 = 8.0;
  static double textSize_10 = 10.0;
  static double textSize_11 = 11.0;
  static double textSize_12 = 12.0;
  static double textSize_13 = 13.0;
  static double textSize_14 = 14.0;
  static double textSize_15 = 15.0;
  static double textSize_16 = 16.0;
  static double textSize_18 = 18.0;
  static double textSize_20 = 20.0;
  static double textSize_22 = 22.0;
  static double textSize_24 = 24.0;
  static double textSize_28 = 28.0;
  static double textSize_32 = 32.0;
  static double textSize_36 = 36.0;
  static double textSize_40 = 40.0;
  static double textSize_44 = 44.0;
  static double textSize_48 = 48.0;

  static double horizontal_margin = size_24;
  static double vertical_margin = size_24;

  static double radius = 16;

  static double getSize(double size) => size;

  static double getTextSize(double size) => size;

  static double getScreenWidth({int? percent}) {
    if (window.screen != null && window.screen!.width != null) {
      if (percent == null) {
        return window.screen!.width!.toDouble();
      } else {
        return (percent / 100) * window.screen!.width!.toDouble();
      }
    }
    return 0.0;
  }

  static double getScreenHeight({int? percent}) {
    if (window.screen != null && window.screen!.height != null) {
      if (percent == null) {
        return window.screen!.height!.toDouble();
      } else {
        return (percent / 100) * window.screen!.height!.toDouble();
      }
    }
    return 0.0;
  }
}
