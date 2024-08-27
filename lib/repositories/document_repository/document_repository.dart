import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';

class DocumentRepository {
  Uri get documentUri => Uri.parse('${MyApi.baseUrl}/api/v1/document');

  Future<List<DocumentData>> getDocument(String type) async {
    try {
      var res = await MyClient().get(Uri.parse('$documentUri?type=$type'));

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var list = (json['data'] as List).map((e) => DocumentData.fromJson(e)).toList();
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