import 'package:arrivo_frond_end_assignment/configure/colors.dart';
import 'package:arrivo_frond_end_assignment/configure/dimens.dart';
import 'package:arrivo_frond_end_assignment/configure/styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { roundCircle, text }

enum RoundButtonWidthType { shortWidth, longWidth }

class ThemeButton extends StatelessWidget {
  final String? text;
  final Widget? contentWidget;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? color;
  final Color? borderColor;
  final bool enable;
  final Function()? onPressed;

  final double? height;
  final double? width;
  final ButtonType? buttonType;
  final RoundButtonWidthType? roundButtonWidthType;

  const ThemeButton({
    this.text,
    this.contentWidget,
    this.textStyle,
    this.padding,
    this.color,
    this.enable = true,
    this.borderColor,
    this.onPressed,
    this.height,
    this.width,
    this.buttonType = ButtonType.roundCircle,
    this.roundButtonWidthType = RoundButtonWidthType.longWidth,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.roundCircle:
        return _buildRoundCircleButton();
      case ButtonType.text:
        return _buildTextButton();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildRoundCircleButton() => InkWell(
      onTap: enable ? tap : null,
      child: Container(
        alignment: Alignment.center,
        width: width ?? (roundButtonWidthType == RoundButtonWidthType.longWidth ? DimenConfig.getSize(220) : DimenConfig.getSize(150)),
        height: height ?? DimenConfig.getSize(35),
        decoration: BoxDecoration(
            color: color?.withOpacity(enable ? 1 : 0.5) ?? ColorConfig.themeDarkBlue.withOpacity(enable ? 1 : 0.5),
            borderRadius: BorderRadius.circular(
              DimenConfig.size_24,
            ),
            border: Border.all(
              color: borderColor ?? (color ?? (enable ? ColorConfig.themeDarkBlue : Colors.transparent)),
            )),
        child: contentWidget ??
            Text(
              text ?? '',
              style: textStyle ?? TextStyleConfig.regularTextStyle(color: Colors.white),
            ),
      ));

  Widget _buildTextButton() => TextButton(
      onPressed: tap,
      child: Text(
        text ?? '',
      ));

  Future<void> tap() async {
    onPressed!();
  }
}
