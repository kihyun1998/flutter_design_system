// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_design_system/style/button/custom_button.dart';

class CustomDynamicTextButton extends StatelessWidget {
  const CustomDynamicTextButton({
    super.key,
    this.boxShadow,
    this.margin,
    required this.padding,
    this.backgroundColor,
    this.borderColor,
    this.hoverColor,
    this.splashColor,
    this.highlightColor,
    required this.width,
    required this.height,
    required this.radius,
    required this.borderWidth,
    this.textHorizontalMargin,
    required this.isDisable,
    required this.onTap,
    required this.text,
    required this.textStyle,
    required this.child,
  });

  /// style
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;

  /// color
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;

  /// size
  final double width;
  final double height;
  final double radius;
  final double borderWidth;
  final double? textHorizontalMargin;

  /// condition
  final bool isDisable;

  /// function
  final VoidCallback onTap;

  /// text
  final String text;
  final TextStyle textStyle;

  /// child
  final Widget child;

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

      return textPainter.width + (textHorizontalMargin ?? 0);
    }

    final textWidth = getTextWidth();

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomButton(
          width: textWidth,
          height: height,
          margin: margin,
          backgroundColor: backgroundColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          highlightColor: highlightColor,
          isDisable: isDisable,
          radius: radius,
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
