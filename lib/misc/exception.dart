// import 'dart:io';
 
// import 'package:flutter/material.dart';
 
// class ServerException implements Exception {
//   final String message;
 
//   ServerException(this.message);
 
//   String getMessage() {
//     return message;
//   }
// }
 
// String handleConstraintElement(dynamic data) {
//   if (data is ConstraintElement) {
//     return data.message ?? "Sedang dalam gangguan";
//   }
//   return data.toString();
// }
 
// Future<String> handleHttpException({
//   required Map<String, dynamic> data,
//   required int statusCode,
// })  async {
//   String message = '';
//   if(statusCode == 400) {
 
//     if(data["message"].toString().toLowerCase().trim() == "internal server error") {
//       message = "Sedang dalam gangguan";
//       return message;
//     }
 
//     final error = ErrorModel.fromJson(data);
//     message = handleConstraintElement(error.message?.first.constraints?.first);
//   } else {
//     if(statusCode == 401) {
//       return message = "Kamu tidak diizinkan mengakses halaman ini";
//     } else if(statusCode == 413) {
//       return message = "Maksimal ukuran berkas 5 MB";
//     } else if(statusCode == 403) {
//       return message = "Anda tidak diizinkan mengakses halaman ini";
//     } else {
//       if(statusCode == 500) {
//         return message = "Sedang dalam gangguan";
//       } else {
//         return message = "Sedang dalam gangguan";
//       }
//     }
//   }
 
//   return message;
// }