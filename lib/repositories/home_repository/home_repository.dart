import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';

class HomeRepository {
  Uri get bannerUri => Uri.parse('${MyApi.baseUrl}/api/v1/banner');
  Uri get newUri => Uri.parse('${MyApi.baseUrl}/api/v1/news');

  Future<void> getBanners() async {
    try {
      var res = await MyClient().get(bannerUri);

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getNews() async {
    try {
      var res = await MyClient().get(newUri);

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
    } catch (e) {
      rethrow;
    }
  }
}
