import 'package:arrivo_frond_end_assignment/configure/colors.dart';
import 'package:arrivo_frond_end_assignment/configure/dimens.dart';
import 'package:arrivo_frond_end_assignment/configure/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum UsageType { normal, count }

class ThemeTextFieldWidget extends StatefulWidget {
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? labelColor;
  final Color? textColor;
  final Color? errorTextColor;
  final String? errorText;
  final Widget? prefixIcon;
  final Icon? icon;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final AsyncSnapshot<dynamic>? snapshot;
  final InputBorder? outlineBorder;
  final InputBorder? focusOutlineBorder;
  final InputBorder? errorOutlineBorder;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatterList;
  final bool showCounter;
  final int? maxLines;
  final Function(String value)? onTextChanged;
  final bool? isShowDeleteIcon;
  final String? Function(String? value)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool? isDense;
  final bool? readOnly;
  final InputDecoration? decoration;
  final Function(String? textValue)? onFieldSubmitted;
  final Function()? onTap;
  final double? height;
  final Color? borderColor;

  late final UsageType? usageType;
  late final int maxCount;

  ThemeTextFieldWidget({
    Key? key,
    this.enabled = true,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.fillColor,
    this.disabledColor,
    this.labelColor = Colors.black,
    this.textColor = Colors.black,
    this.errorTextColor,
    this.errorText,
    this.prefixIcon,
    this.icon,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.words,
    this.textInputType = TextInputType.text,
    this.snapshot,
    this.outlineBorder,
    this.focusOutlineBorder,
    this.errorOutlineBorder,
    this.textEditingController,
    this.maxLength,
    this.textInputFormatterList,
    this.showCounter = false,
    this.maxLines,
    this.onTextChanged,
    this.isShowDeleteIcon = true,
    this.validator,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.isDense = true,
    this.readOnly,
    this.onFieldSubmitted,
    this.onTap,
    this.decoration,
    this.height,
    this.borderColor,
  }) : super(key: key) {
    usageType = UsageType.normal;
  }

  ThemeTextFieldWidget.count({
    Key? key,
    required this.maxCount,
    this.enabled = true,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.fillColor,
    this.disabledColor,
    this.labelColor = Colors.black,
    this.textColor = Colors.black,
    this.errorTextColor,
    this.errorText,
    this.prefixIcon,
    this.icon,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.multiline,
    this.snapshot,
    this.outlineBorder,
    this.focusOutlineBorder,
    this.errorOutlineBorder,
    this.textEditingController,
    this.maxLength,
    this.textInputFormatterList,
    this.showCounter = false,
    this.maxLines,
    this.onTextChanged,
    this.isShowDeleteIcon = true,
    this.validator,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.prefix,
    this.suffixIcon,
    this.isDense,
    this.readOnly,
    this.onFieldSubmitted,
    this.onTap,
    this.suffix,
    this.usageType,
    this.decoration,
    this.height,
    this.borderColor,
  }) : super(key: key) {
    usageType = UsageType.count;
  }

  @override
  State<StatefulWidget> createState() => _ThemeTextFieldWidgetState();
}

class _ThemeTextFieldWidgetState extends State<ThemeTextFieldWidget> {
  late final TextEditingController _textEditingController;
  late final FocusNode _focusNode;
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();

    _textEditingController = widget.textEditingController ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.usageType) {
      case UsageType.count:
        return Column(
          children: [
            TextFormField(
              // cursorHeight: 17,
              // cursorRadius: Radius.circular(2),
              controller: _textEditingController,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              focusNode: _focusNode,
              enabled: widget.enabled,
              maxLength: widget.maxLength,
              textAlign: widget.textAlign ?? TextAlign.start,
              style: _getTextStyle(widget.textStyle),
              keyboardType: widget.textInputType,
              textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
              // inputFormatters: _getTextInputFormatterList(widget.textInputFormatterList),
              maxLines: widget.maxLines ?? 3,
              obscureText: widget.obscureText,
              validator: widget.validator,
              onChanged: (value) {
                // widget.onTextChanged?.call(value);
                // if (value.isNotEmpty) {
                //   Pattern regexPattern = RegexPatternUtil.spacingAndNewLinePattern;
                //   _wordCount = regexPattern.allMatches(value.toString().trim()).length;
                // } else {
                //   _wordCount = 0;
                // }
                // setState(() {});
              },
              decoration: widget.decoration ??
                  InputDecoration(
                    errorText: widget.errorText,
                    errorStyle: TextStyleConfig.regularTextStyle(
                      fontSize: DimenConfig.textSize_14,
                      color: widget.errorTextColor ?? Colors.red,
                    ),
                    contentPadding: widget.contentPadding ??
                        EdgeInsets.symmetric(
                          horizontal: DimenConfig.size_12,
                          vertical: DimenConfig.size_16,
                        ),
                    filled: true,
                    fillColor: widget.enabled ? widget.fillColor ?? Colors.transparent : ColorConfig.disabledColor.withOpacity(0.5),
                    labelText: widget.labelText,
                    labelStyle: _getLabelStyle(widget.labelStyle ?? widget.textStyle, _focusNode.hasFocus || _textEditingController.text.trim().isNotEmpty),
                    hintText: widget.hintText,
                    hintStyle: _getHintStyle(widget.hintStyle),
                    border: _getInputBorder(widget.outlineBorder),
                    enabledBorder: _getInputBorder(widget.outlineBorder),
                    disabledBorder: _getInputBorder(widget.outlineBorder),
                    errorBorder: _getErrorInputBorder(widget.errorOutlineBorder),
                    focusedErrorBorder: _getErrorInputBorder(widget.errorOutlineBorder),
                    focusedBorder: _getInputBorder(widget.focusOutlineBorder),
                    prefixIcon: widget.prefixIcon,
                    prefix: widget.prefix,
                    isDense: widget.isDense,
                    suffixIcon: widget.suffixIcon,
                    suffix: widget.suffix,
                  ),
              readOnly: widget.readOnly ?? false,
              onFieldSubmitted: widget.onFieldSubmitted,
              // onSaved: widget.onFieldSubmitted,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: DimenConfig.size_16),
              child: Text(
                '${widget.maxCount - _wordCount} words remaining',
                textAlign: TextAlign.right,
                style: TextStyleConfig.regularTextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      default:
        return Container(
          alignment: Alignment.center,
          height: widget.height ?? DimenConfig.getSize(30),
          padding: EdgeInsets.only(left: DimenConfig.size_10),
          decoration: BoxDecoration(
            color: widget.enabled ? widget.fillColor ?? Colors.white : widget.disabledColor ?? ColorConfig.disabledColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(DimenConfig.size_4),
            border: Border.all(
              color: widget.borderColor ?? ColorConfig.grayTextColor,
            ),
          ),
          // height: DimenConfig.getSize(50),
          child: TextFormField(
            // cursorHeight: 17,
            // cursorRadius: Radius.circular(2),
            controller: _textEditingController,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            focusNode: _focusNode,
            enabled: widget.enabled,
            maxLength: widget.maxLength,
            textAlign: widget.textAlign ?? TextAlign.start,
            style: _getTextStyle(widget.textStyle),
            keyboardType: widget.textInputType,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            inputFormatters: widget.textInputFormatterList,
            maxLines: widget.maxLines,
            obscureText: widget.obscureText,
            validator: widget.validator,
            onChanged: widget.onTextChanged,
            decoration: widget.decoration ??
                InputDecoration(
                  errorText: widget.errorText,
                  errorStyle: TextStyleConfig.regularTextStyle(
                    fontSize: DimenConfig.textSize_14,
                    color: widget.errorTextColor ?? Colors.red,
                  ),
                  contentPadding: widget.contentPadding ??
                      EdgeInsets.symmetric(
                          // horizontal: DimenConfig.size_12,
                          // vertical: DimenConfig.size_16,
                          ),
                  //filled: true,
                  // fillColor: widget.enabled
                  //     ? widget.fillColor ?? Colors.transparent
                  //     : widget.disabledColor ??
                  //         ColorConfig.disabledColor.withOpacity(0.5),
                  labelText: widget.labelText,
                  labelStyle: _getLabelStyle(widget.labelStyle ?? widget.textStyle, _focusNode.hasFocus || _textEditingController.text.trim().isNotEmpty),
                  hintText: widget.hintText,
                  hintStyle: _getHintStyle(widget.hintStyle),
                  border: InputBorder.none,
                  // border: _getInputBorder(widget.outlineBorder),
                  // enabledBorder: _getInputBorder(widget.outlineBorder),
                  // disabledBorder: _getInputBorder(widget.outlineBorder),
                  // errorBorder: _getErrorInputBorder(widget.errorOutlineBorder),
                  // focusedErrorBorder: _getErrorInputBorder(widget.errorOutlineBorder),
                  // focusedBorder: _getInputBorder(widget.focusOutlineBorder),
                  focusedBorder: InputBorder.none,
                  prefixIcon: widget.prefixIcon,
                  prefix: widget.prefix,
                  isDense: widget.isDense,
                  suffixIcon: widget.suffixIcon,
                  suffix: widget.suffix,
                  counterText: widget.showCounter ? null : '',
                ),
            readOnly: widget.readOnly ?? false,
            onFieldSubmitted: widget.onFieldSubmitted,
            onTap: widget.onTap,
            // onSaved: widget.onFieldSubmitted,
          ),
        );
    }
  }

  // List<TextInputFormatter>? _getTextInputFormatterList(List<TextInputFormatter>? textInputFormatters) {
  //   List<TextInputFormatter> textInputFormatterList = [];
  //   if (textInputFormatters != null) {
  //     textInputFormatterList.addAll(textInputFormatters);
  //   }
  //   textInputFormatterList.add(MaxWordTextFormatter(widget.maxCount));
  //   return textInputFormatterList;
  // }

  TextStyle _getTextStyle(TextStyle? textStyle) {
    return textStyle ??
        TextStyleConfig.regularTextStyle(
          fontSize: DimenConfig.textSize_16,
          color: Colors.black,
        );
  }

  TextStyle _getLabelStyle(TextStyle? textStyle, bool hasFocus) {
    return textStyle ??
        TextStyleConfig.mediumTextStyle(
          fontSize: DimenConfig.textSize_16,
          color: ColorConfig.grayTextColor,
        );
  }

  TextStyle _getHintStyle(TextStyle? textStyle) {
    return textStyle ??
        TextStyleConfig.regularTextStyle(
          fontSize: DimenConfig.textSize_16,
          color: ColorConfig.grayTextColor,
        );
  }

  InputBorder _getInputBorder(InputBorder? inputBorder) {
    return inputBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.grayTextColor,
            width: DimenConfig.size_1,
          ),
          borderRadius: BorderRadius.circular(
            DimenConfig.size_40,
          ),
        );
  }

  InputBorder _getErrorInputBorder(InputBorder? inputBorder) {
    return inputBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: DimenConfig.size_1,
          ),
          borderRadius: BorderRadius.circular(
            DimenConfig.size_8,
          ),
        );
  }
}
