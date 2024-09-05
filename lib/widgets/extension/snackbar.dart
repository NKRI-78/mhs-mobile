import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class ShowSnackbar {
  ShowSnackbar._();
  static snackbar(
      BuildContext context, String content, String label, Color backgroundColor,
      [Duration? time]) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: time ?? const Duration(seconds: 2),
      backgroundColor: backgroundColor,
      content: Text(content,
      style: const TextStyle(
        color: whiteColor,
        fontSize: fontSizeLarge
      )),
      action: SnackBarAction(
          textColor: whiteColor,
          label: label,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
    ));
  }
}
