import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/repositories/partnership_repository/models/partnership_model.dart';

class PartnershipRepository {
  Uri get documentUri => Uri.parse('${MyApi.baseUrl}/api/v1/partnership');

  Future<List<PartnershipData>> getPartnership() async {
    try {
      var res = await MyClient().get(documentUri);

      debugPrint(res.body);
      debugPrint("Test $documentUri");

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var list = (json['data'] as List).map((e) => PartnershipData.fromJson(e)).toList();
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
}