import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/grade_student_repository/model/grade_student_model.dart';
import 'package:mhs_mobile/repositories/grade_student_repository/model/grade_student_report_model.dart';

class GradeStudentRepository {
    Uri get grade => Uri.parse('${MyApi.baseUrl}/api/v1/student/my-grade');
    Uri get gradeReport => Uri.parse('${MyApi.baseUrl}/api/v1/student/parent-check-grade');

    final http = getIt<BaseNetworkClient>();

    Future<GradeStudentModel> getMyGrade() async {
        try {
        final res = await MyClient().get(grade);

        debugPrint(res.body);
        final json = jsonDecode(res.body);
        if (res.statusCode == 200) {
            return GradeStudentModel.fromJson(json);
        } else {
            throw "Ada masalah pada server";
        }
        } on SocketException {
        throw "Terjadi kesalahan jaringan";
        }
    }

    Future<GradeStudentReportModel> getStudentReport() async {
        try {
        final res = await MyClient().get(gradeReport);

        debugPrint(res.body);
        final json = jsonDecode(res.body);
        if (res.statusCode == 200) {
            return GradeStudentReportModel.fromJson(json);
        } else {
            throw "Ada masalah pada server";
        }
        } on SocketException {
            throw "Terjadi kesalahan jaringan";
        }
    }
}