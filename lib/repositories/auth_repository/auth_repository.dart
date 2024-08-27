// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/repositories/auth_repository/models/club/club.dart';

import 'package:mhs_mobile/repositories/auth_repository/models/user/user.dart';

class LoggedIn {
  final User user;
  final String token;
  LoggedIn({
    required this.user,
    required this.token,
  });
}

class EmailNotActivatedFailure implements Exception {
  final String message;

  EmailNotActivatedFailure({this.message = 'Terjadi kesalahan'});
}

enum VerifyEmailType { sendingOtp, verified }

class AuthRepository {
  String get v1 => '${MyApi.baseUrl}/api/v1/auth';

  Future<LoggedIn> login(
      {required String email, required String password}) async {
    try {
      final res = await http.post(Uri.parse('$v1/login'), body: {
        'email': email,
        'password': password,
      });

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return LoggedIn(
          token: json['data']['token'],
          user: User.fromJson(
            json['data'],
          ),
        );
      }
      if (res.statusCode == 401) {
        throw EmailNotActivatedFailure(
            message: json['message'] ?? "Terjadi kesalahan");
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
      throw json['message'] ?? "Terjadi kesalahan";
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register({
    String name = '',
    String email = '',
    String phone = '',
    String password = '',
  }) async {
    try {
      final res = await http.post(Uri.parse('$v1/register'), body: {
        'name': name,
        'email': email,
        'phone': phone,
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
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ClubModel>> getClubList() async {
    try {
      final res = await http.get(Uri.parse('$v1/get-club-list'));

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        final list = json['data'] as List;
        return list.map((e) => ClubModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> verifyOtp(
      String email, String verificationCode, VerifyEmailType type) async {
    try {
      final res = await http.post(Uri.parse('$v1/verify-email'), body: {
        'email': email,
        'otp': verificationCode,
        'type': type == VerifyEmailType.sendingOtp ? 'SENDING_OTP' : 'VERIFIED'
      });

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        if (type == VerifyEmailType.sendingOtp) {
          return null;
        }
        return User.fromJson(json['data']);
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
