import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/news_repository/models/detail_news_model.dart';

class NewsRepository {
  String get newsDetail => '${MyApi.baseUrl}/api/v1/news';

  final http = getIt<BaseNetworkClient>();

  Future<DetailNewsModel> getDetailNews(int idNews) async {
    try {
      final res = await http.get(Uri.parse('$newsDetail/$idNews'));

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return DetailNewsModel.fromJson(json);
      } else {
        throw "Ada masalah pada server";
      }
    } catch (e) {
      throw "Ada masalah pada server";
    }
  }
}