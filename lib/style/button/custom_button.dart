// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
    this.radius = 0,
    this.borderWidth = 1,
    this.isDisable = false,
    required this.onTap,
    required this.child,
  });

  /// style
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry margin;
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

  /// condition
  final bool isDisable;

  /// function
  final VoidCallback onTap;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          isDisable ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: IgnorePointer(
        ignoring: isDisable,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                    width: borderWidth,
                  )
                : null,
            boxShadow: boxShadow,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: hoverColor,
              splashColor: splashColor,
              highlightColor: highlightColor,
              onTap: isDisable ? null : onTap,
              borderRadius: BorderRadius.circular(radius),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
