// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_design_system/style/button/custom_button.dart';

class CustomDynamicTextButton extends StatelessWidget {
  const CustomDynamicTextButton({
    super.key,
    this.boxShadow,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.backgroundColor,
    this.borderColor,
    this.hoverColor,
    this.splashColor,
    this.highlightColor,
    required this.width,
    required this.height,
    required this.radius,
    required this.borderWidth,
    required this.isDisable,
    required this.onTap,
    required this.text,
    required this.textStyle,
  });

  /// style
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double borderWidth;

  /// color
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;

  /// size
  final double width;
  final double height;

  /// condition
  final bool isDisable;

  /// function
  final VoidCallback onTap;

  /// text
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    double getTextWidth() {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: textStyle,
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      return textPainter.width + padding.horizontal;
    }

    final textWidth = getTextWidth();

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomButton(
          /// size
          width: textWidth,
          height: height,

          /// color
          backgroundColor: backgroundColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          highlightColor: highlightColor,

          /// style
          margin: margin,
          padding: padding,
          radius: radius,
          boxShadow: boxShadow,
          borderWidth: borderWidth,
          borderColor: borderColor,

          isDisable: isDisable,
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
