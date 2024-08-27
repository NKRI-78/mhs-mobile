import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';

class AppRepository {
  String get profile => '${MyApi.baseUrl}/api/v1/profile';

  final http = getIt<BaseNetworkClient>();

  Future<ProfileModel> getProfile() async {
    try {
      final res = await http.get(Uri.parse(profile));

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return ProfileModel.fromJson(json);
      } else {
        throw "error api";
      }
    } catch (e) {
      rethrow;
    }
  }
}