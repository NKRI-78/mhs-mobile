// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/auth_repository/models/user/generation_open.dart';

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
  String get generation => '${MyApi.baseUrl}/api/v1/school-generation/open';
  final httpBase = getIt<BaseNetworkClient>(); 

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



  Future<void> loginExistingStudent(
      {required String nisn}) async {
    try {
      final res = await httpBase.post(Uri.parse('$v1/verify-existing-student'), body: {
        'nisn': nisn,
      });
      debugPrint("Nisn : $nisn");
      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
      throw json['message'] ?? "Terjadi kesalahan";
    } catch (e) {
      rethrow;
    }
  }

  Future<LoggedIn> loginParent(
      {required String fullname, required String student , required String nisn}) async {
    try {
      final res = await httpBase.post(Uri.parse('$v1/verify-parent'), body: {
        'fullname': fullname,
        'studentName': student,
        'nisn': nisn,
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

  Future<GenerationOpenModel> getGenerationOpen() async {
    try {
      final res = await httpBase.get(Uri.parse(generation));

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return GenerationOpenModel.fromJson(json);
      } else {
        throw "Ada masalah pada server";
      }
    } catch (e) {
      throw "Ada masalah pada server";
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

  Future<void> forgotPasswordSendOTP(String email) async {
    try {
      final res = await http.post(Uri.parse('$v1/forgot-password'),body: {
        'email': email,
        'step': "SENDING_OTP",
      });
      debugPrint("email : $email");
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

  Future<void> forgotPasswordVerifyOTP(String email, String otp) async {
    try {
      final res = await http.post(Uri.parse('$v1/forgot-password'),body: {
        'email': email,
        'step': "VERIFICATION_OTP",
        'otp': otp,
      });
      debugPrint("email : $email");
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

  Future<void> forgotPasswordChangePass(String email, String otp, String password) async {
    try {
      final res = await http.post(Uri.parse('$v1/forgot-password'),body: {
        'email': email,
        'step': "CHANGE_PASSWORD",
        'otp': otp,
        'password': password,
      });
      debugPrint("email : $email");
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
