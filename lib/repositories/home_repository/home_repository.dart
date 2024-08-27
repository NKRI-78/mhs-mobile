import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/banner_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_channel_model.dart';

class HomeRepository {
  Uri get bannerUri => Uri.parse('${MyApi.baseUrl}/api/v1/banner');
  Uri get newUri => Uri.parse('${MyApi.baseUrl}/api/v1/news');
  Uri get profileUri => Uri.parse('${MyApi.baseUrl}/api/v1/profile');
  String get studentUrl => '${MyApi.baseUrl}/api/v1/student';

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

  Future<ProfileModel> getProfile() async {
    try {
      final res = await MyClient().get(profileUri);

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return ProfileModel.fromJson(json);
      } else {
        throw "error api";
      }
    } catch (e) {
      // print(e);
      debugPrint(e.toString());
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

  Future<String> registerStudent(
      NewStudentModel student, PaymentChannelModel payment) async {
    try {
      var res = await MyClient().post(Uri.parse('$studentUrl/register'), body: {
        "fullname": student.fullname,
        "birthDate": student.birthDate,
        "originSchool": student.originSchool,
        "address": "",
        "phone": student.phone,
        "parentName": student.parentName,
        "parentPhone": student.parentPhone,
        "outfitSize": student.outfitSize,
        "height": student.height,
        "channel_id": payment.id?.toString(),
      });

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return json['data']['payment']['paymentNumber'];
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
