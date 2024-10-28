import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/absence_repository/model/absence_checkin_model.dart';

class AbsenceData {
  final Attendance attendance;

  AbsenceData({required this.attendance});
}

class AbsenceRepository {
  Uri get abcenseUri => Uri.parse('${MyApi.baseUrl}/api/v1/attendance/check-in');

  final http = getIt<BaseNetworkClient>();

  Future<AbsenceData> getAbseceChekin({required String token}) async {
    try {
      var res = await MyClient().post(Uri.parse('$abcenseUri'), body: {
        "token": token,
      });

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return AbsenceData(
          attendance: Attendance.fromJson(
            json["data"]["attendance"]
        ));
      }
      if (res.statusCode == 400) {
        throw json['message'] == "jwt expired" ? "Kode Barcode Tidak Sesuai" : json['message'];
      }
      throw json['message'] ?? "Terjadi kesalahan";
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }
}