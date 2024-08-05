import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/home_repository/models/banner_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';

class HomeRepository {
  Uri get bannerUri => Uri.parse('${MyApi.baseUrl}/api/v1/banner');
  Uri get newUri => Uri.parse('${MyApi.baseUrl}/api/v1/news');

  Future<List<BannerModel>> getBanners() async {
    try {
      var res = await MyClient().get(bannerUri);

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var list =
            (json['data'] as List).map((e) => BannerModel.fromJson(e)).toList();
        return list;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      } else {
        throw "Error";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginationModel<NewsModel>> getNews() async {
    try {
      var res = await MyClient().get(newUri);

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var pagination = Pagination.fromJson(json['data']);
        var list = (json['data']['data'] as List)
            .map((e) => NewsModel.fromJson(e))
            .toList();
        return PaginationModel<NewsModel>(pagination: pagination, list: list);
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      } else {
        throw "Error";
      }
    } catch (e) {
      rethrow;
    }
  }
}
