
import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
    static Future<void> openLink({required String url, required BuildContext context}) async {
      final uri = Uri.parse(url);

    // if(!url.contains(RegExp(r'^(http|https)://'))){
    //   ShowSnackbar.snackbar(context, "Kata Sandi minimal 8 character", '',
    //       errorColor);
    // }

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}