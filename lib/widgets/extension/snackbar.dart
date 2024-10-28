import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class ShowSnackbar {
  ShowSnackbar._();

  static snackbar(
      BuildContext context, String content, String label, Color backgroundColor,
      [Duration? time]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Text(
          content, 
          style: const TextStyle(
            color: whiteColor,
            fontSize: fontSizeLarge
          )
        ),
        action: SnackBarAction(
          textColor: whiteColor,
          label: label,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()
        ),
    )
);
}
}