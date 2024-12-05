// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.width,
    this.height,
    this.maxLength,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.margin,
    this.obscure,
    this.contentPadding,
    this.useFloatingLabel,
    this.focusBorderWidth = 0,
    required this.focusBorderColor,
    this.focusRadius = 0,
    this.enableBorderWidth = 0,
    required this.enableBorderColor,
    this.enableRadius = 0,
    this.disableBorderWidth = 0,
    required this.disableBorderColor,
    this.disableRadius = 0,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixMargin,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixMargin,
    this.readOnly,
    this.enabled,
    this.focusNode,
    this.onFocus,
    required this.controller,
    this.onChange,
    this.onSubmitted,
  });

  /// size
  final double? width;
  final double? height;

  /// text
  final int? maxLength;
  final TextStyle? textStyle;

  /// hint
  final String? hintText;
  final TextStyle? hintTextStyle;

  /// label
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;

  /// style
  final EdgeInsetsGeometry? margin;
  final bool? obscure;
  final EdgeInsetsGeometry? contentPadding;
  final bool? useFloatingLabel;

  /// border
  final double focusBorderWidth;
  final Color focusBorderColor;
  final double focusRadius;
  final double enableBorderWidth;
  final Color enableBorderColor;
  final double enableRadius;
  final double disableBorderWidth;
  final Color disableBorderColor;
  final double disableRadius;

  /// prefix
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final EdgeInsetsGeometry? prefixMargin;

  /// suffix
  final Widget? suffixIcon;
  final double? suffixIconSize;
  final EdgeInsetsGeometry? suffixMargin;

  /// possible
  final bool? readOnly;
  final bool? enabled;

  /// focus
  final FocusNode? focusNode;
  final VoidCallback? onFocus;

  /// controller
  final TextEditingController controller;

  /// function
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(
        () {
          onFocus();
        },
      );
    }
  }

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(
        () {
          onFocus();
        },
      );
    }
    super.dispose();
  }

  void onFocus() {
    if (widget.focusNode!.hasFocus) {
      widget.onFocus!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enabled,

        /// function
        onChanged: widget.onChange,

        /// obscure
        obscureText: widget.obscure ?? false,

        /// text style
        style: widget.textStyle,

        /// text maxLength
        maxLength: widget.maxLength,

        decoration: InputDecoration(

            /// padding
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(0),

            /// counter Text는 숨겼다. 따로 구현하는게 좋음
            counterText: '',
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle,

            /// prefix
            ///
            /// ----example----
            /// Container(
            ///   margin:...
            ///   child: Icon()
            /// )
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconSize != null
                ? BoxConstraints(
                    maxWidth: widget.prefixIconSize! +
                        ((widget.prefixMargin ?? const EdgeInsets.all(0))
                                .horizontal *
                            2),
                    maxHeight: widget.prefixIconSize! +
                        ((widget.prefixMargin ?? const EdgeInsets.all(0))
                                .vertical *
                            2),
                  )
                : null,

            /// suffix
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: widget.suffixIconSize != null
                ? BoxConstraints(
                    maxWidth: widget.suffixIconSize! +
                        ((widget.suffixMargin ?? const EdgeInsets.all(0))
                                .horizontal *
                            2),
                    maxHeight: widget.suffixIconSize! +
                        ((widget.suffixMargin ?? const EdgeInsets.all(0))
                                .vertical *
                            2),
                  )
                : null,

            /// label
            labelText: widget.enabled ?? true ? widget.labelText : null,
            labelStyle: widget.labelStyle,
            floatingLabelStyle: widget.floatingLabelStyle,
            floatingLabelBehavior: widget.useFloatingLabel ?? true
                ? FloatingLabelBehavior.auto
                : FloatingLabelBehavior.never,

            /// border
            /// focus
            focusedBorder: OutlineInputBorder(
              borderSide: widget.focusBorderWidth == 0
                  ? BorderSide.none
                  : BorderSide(
                      width: widget.focusBorderWidth,
                      color: widget.focusBorderColor,
                    ),
              borderRadius: BorderRadius.circular(widget.focusRadius),
            ),

            /// enable
            enabledBorder: OutlineInputBorder(
              borderSide: widget.enableBorderWidth == 0
                  ? BorderSide.none
                  : BorderSide(
                      width: widget.enableBorderWidth,
                      color: widget.enableBorderColor,
                    ),
              borderRadius: BorderRadius.circular(widget.enableRadius),
            ),

            /// disable
            disabledBorder: OutlineInputBorder(
              borderSide: widget.disableBorderWidth == 0
                  ? BorderSide.none
                  : BorderSide(
                      width: widget.disableBorderWidth,
                      color: widget.disableBorderColor,
                    ),
              borderRadius: BorderRadius.circular(widget.disableRadius),
            )),

        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
