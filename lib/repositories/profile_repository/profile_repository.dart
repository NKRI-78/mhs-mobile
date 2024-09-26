import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';

import 'package:http/http.dart' as http;

class ProfileRepository {
  String get profileUpdate => '${MyApi.baseUrl}/api/v1/profile/update-photo';
  String get mediaUpload => 'http://157.245.193.49:3099/api/v1/media';
  String get profileDelete => '${MyApi.baseUrl}/api/v1/profile/delete-user';

  final httpBase = getIt<BaseNetworkClient>();

  Future<void> updateProfile({
    String linkAvatar = '',
  }) async {
    debugPrint("LinkAvatar :  $linkAvatar");
    try {
      final res = await httpBase.post(Uri.parse(profileUpdate), body: {
        'pictureUrl': linkAvatar,
      });
      debugPrint(res.body);
      debugPrint("Link Avatar : $linkAvatar");

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

  Future<List<dynamic>> postMedia({
    required String folder,
    required File media
  }) async {
    try {
      var request = http.MultipartRequest('PUT', Uri.parse(mediaUpload));
      request.fields.addAll({
        'folder': folder,
        'app': 'MHS-MOBILE',
      });
      var headers = {
        'Authorization': 'Bearer ${httpBase.token}'
      };
      request.headers.addAll(headers);
      debugPrint("Image : $media");
      request.files.add(await http.MultipartFile.fromPath('files', media.path));

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        return jsonDecode(data)['data'];
      }
      else {
        debugPrint(response.reasonPhrase);
      }
    return [];
    } catch (e) {
      debugPrint('error profile $e');
      rethrow;
    }
  }

  Future<void> deleteProfile() async {
    try {
      final res = await httpBase.delete(Uri.parse(profileDelete));

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