import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';

class MyClient extends http.BaseClient {
  final http.Client _httpClient = http.Client();

  AppBloc app = getIt<AppBloc>();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer ${app.state.token}',
    });
    return _httpClient.send(request);
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _httpClient.post(
      url,
      headers: {
        ...headers ?? {},
        HttpHeaders.authorizationHeader: 'Bearer ${app.state.token}'
      },
      body: body,
    );
  }
}
