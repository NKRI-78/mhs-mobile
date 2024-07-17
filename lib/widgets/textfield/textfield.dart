import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mhs_mobile/misc/theme.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r"[a-zA-Z0-9_]+@[a-zA-Z]+\.(com|net|org)$").hasMatch(this);
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? emptyText;
  final bool isPrefixIcon;
  final Widget? prefixIcon;
  final bool isSuffixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType? textInputType;
  final int minLines;
  final int maxLines;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final Color counterColor;
  final Color fillColor;
  final bool isPhoneNumber;
  final bool isEmail;
  final bool isPassword;
  final bool isName;
  final bool isAlphabetsAndNumbers;
  final bool isBorder;
  final bool isBorderRadius;
  final bool readOnly;
  final bool isEnabled;
  final int? maxLength;

  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.isPrefixIcon = false,
    this.prefixIcon,
    this.isSuffixIcon = false,
    this.suffixIcon,
    this.hintText,
    this.emptyText,
    this.labelText,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.textInputType,
    this.counterColor = whiteColor,
    this.fillColor = whiteColor,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.isEmail = false,
    this.isPassword = false,
    this.isName = false,
    this.isAlphabetsAndNumbers = false,
    this.isBorder = true,
    this.isBorderRadius = false,
    this.readOnly = false,
    this.isEnabled = true,
    this.maxLength,
    this.isPhoneNumber = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(context) {
    return TextFormField(
      controller: widget.controller,
      minLines: widget.maxLines,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      validator: (value) {
        if (value == null || value.isEmpty) {
          widget.focusNode?.requestFocus();
          return widget.emptyText;
        }
        return null;
      },
      onChanged: widget.onChanged,
      enableInteractiveSelection: true,
      textCapitalization: !widget.isEmail ? TextCapitalization.sentences : TextCapitalization.none,
      enabled: widget.isEnabled,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword ? obscureText : false,
      style: const TextStyle(
        fontSize: fontSizeLarge,
      ),
      onFieldSubmitted: (String v) {
        setState(() {
          widget.textInputAction == TextInputAction.done
              ? FocusScope.of(context).consumeKeyboardToken()
              : FocusScope.of(context).requestFocus(widget.nextNode);
        });
      },
      inputFormatters: widget.isAlphabetsAndNumbers
          ? [
              FilteringTextInputFormatter.singleLineFormatter,
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
            ]
          : widget.isName
              ? [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.singleLineFormatter,
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                ]
              : widget.isEmail
                  ? [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ]
                  : [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: true,
        isDense: true,
        prefixIcon: widget.isPrefixIcon ? widget.prefixIcon : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: toggle,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: whiteColor,
                  size: 18.0,
                ),
              )
            : widget.isSuffixIcon
                ? widget.suffixIcon
                : null,
        counterText: "",
        counterStyle:
            TextStyle(color: widget.counterColor, fontSize: fontSizeLarge),
        floatingLabelBehavior: widget.floatingLabelBehavior,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: fontSizeLarge,
          fontWeight: FontWeight.w500,
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: fontSizeLarge,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: const BorderSide(
        //       color: whiteColor,
        //       width: 1.0,
        //       ),
        // ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}