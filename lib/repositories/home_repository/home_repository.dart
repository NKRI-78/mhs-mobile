import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/banner_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/message_home_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_alumni_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_channel_model.dart';

class HomeRepository {
  Uri get bannerUri => Uri.parse('${MyApi.baseUrl}/api/v1/banner');
  Uri get testimoni => Uri.parse('${MyApi.baseUrl}/api/v1/testimoni');
  String get newUri => '${MyApi.baseUrl}/api/v1/news';
  Uri get profileUri => Uri.parse('${MyApi.baseUrl}/api/v1/profile');
  Uri get notifUri => Uri.parse('${MyApi.baseUrl}/api/v1/notification');
  Uri get messageHome => Uri.parse('${MyApi.baseUrl}/api/v1/caption/by-user-role');
  String get studentUrl => '${MyApi.baseUrl}/api/v1/student';
  String get profile => '${MyApi.baseUrl}/api/v1/profile';
  String get changePasswordUser => '${MyApi.baseUrl}/api/v1/auth/change-password';

  final http = getIt<BaseNetworkClient>();

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
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<void> setFcm(String token) async {
    try {
      debugPrint('FCM : $token');
      final res = await http.post(Uri.parse('$profile/set-fcm-token'), body: {
        'fcm_token': token
      }, headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${getIt<AppBloc>().state.token}'
      });
      debugPrint('Bearer ${getIt<AppBloc>().state.token}');
      debugPrint('Data FCM  : ${res.body}');

      if (res.statusCode == 200) {
        return;
      } else {
        throw "Ada masalah pada server";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<List<TestimoniData>> getTestimoni() async {
    try {
      var res = await MyClient().get(testimoni);

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var list =
            (json['data'] as List).map((e) => TestimoniData.fromJson(e)).toList();
        return list;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      } else {
        throw "Error";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
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
        throw "Ada masalah pada server";
      }
    } catch (e) {
      // print(e);
      debugPrint(e.toString());
      throw "Ada masalah pada server";
    }
  }

  Future<MessageHomeModel> getMessageHome() async {
    try {
      final res = await MyClient().get(messageHome);

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return MessageHomeModel.fromJson(json);
      } else {
        throw "Ada masalah pada server";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<PaginationModel<NewsModel>> getNews({int page = 1}) async {
    try {
      final res = await http.get(Uri.parse('$newUri?page=$page'));

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
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
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
        "gender": student.gender,
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
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<void> setDeleteFcm() async {
    try {
      final res = await http.post(Uri.parse('$profile/delete-fcm-token'));

      debugPrint('Status FCM  : ${res.body}');

      if (res.statusCode == 200) {
        return;
      } else {
        throw "error api";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }
  
  Future<int?> getCountNotif() async {
    try {
      var res = await MyClient().get(Uri.parse('$notifUri/count-information'));

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return json['data'];
      } else {
        throw "error api";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<void> changePassword({String password = ''}) async {
    try {
      final res = await http.post(Uri.parse(changePasswordUser), body: {
        'password': password,
      });

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }
}
