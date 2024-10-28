import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';

class AddTestimoniRepository {
  Uri get addTesti => Uri.parse('${MyApi.baseUrl}/api/v1/testimoni');

  final http = getIt<BaseNetworkClient>();

  Future<void> addTestimoni({required String caption, required String msg, required String imageUrl}) async {
    try {
      var res = await MyClient().post(Uri.parse('$addTesti'), body: {
        "caption": caption,
        "message": msg,
        "imageUrl": imageUrl
      });

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
      throw json['message'] ?? "Terjadi kesalahan";
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }


}