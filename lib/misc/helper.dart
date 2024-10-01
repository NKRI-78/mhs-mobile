
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:new_version_plus/new_version_plus.dart';
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

  static Future<void> update(BuildContext context) async {
    NewVersionPlus newVersion = NewVersionPlus(androidId: 'com.inovatif78.mhs_mobile', iOSId: 'com.inovatif78.mhs-mobile');
    final status = await newVersion.getVersionStatus();
    debugPrint("Store Link : ${status?.appStoreLink ?? ""}");
    final url = Platform.isAndroid
        ? status?.appStoreLink ?? ""
        : "https://apps.apple.com/id/app/mhs/id6723889295";
    final uri = Uri.parse(url);


    if(!url.contains(RegExp(r'^(http|https)://'))){
      ShowSnackbar.snackbar(context, "Ada kesalahan dengan update aplikasi, silahkan update melalui Playstore atau Appstore", '',
          errorColor);
    }

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}