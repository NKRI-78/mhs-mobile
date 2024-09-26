import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/file_storage.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;


class DownloadHelper {
  static Future<void> downloadDoc(
      {required BuildContext context, required String url}) async {
    int total = 0;
    int received = 0;

    late http.StreamedResponse response;

    final List<int> bytes = [];

    String originName = p.basename(url.split('/').last).split('.').first;
    String ext = p.basename(url).toString().split('.').last;

    String filename = "${DateFormat('yyyydd').format(DateTime.now())}-$originName.$ext";

    bool isExistFile = await FileStorage.checkFileExist(filename);

    if (!isExistFile && context.mounted) {
      ProgressDialog pr = ProgressDialog(context: context);
      pr.show(
          backgroundColor: primaryColor,
          msgTextAlign: TextAlign.start,
          max: 100,
          msgColor: whiteColor,
          msg: "Harap tunggu...",
          progressBgColor: greyColor,
          progressValueColor: primaryColor,
          onStatusChanged: (status) async {
            if (status == DialogStatus.opened) {
              response = 
              await http.Client().send(http.Request('GET', Uri.parse(url)));

              total = response.contentLength ?? 0;

              response.stream.listen((value) {
                bytes.addAll(value);
                received = value.length;
                ProgressDialog pr = ProgressDialog(context: context);
                int progress = (((received / total) * 100).toInt());
                pr.update(value: progress, msg: 'File Downloading...');
              }).onDone(() async {
                pr.close();
                Uint8List uint8List = Uint8List.fromList(bytes);

                await FileStorage.saveFile(uint8List, filename);
                // ignore: use_build_context_synchronously
                if (context.mounted) {
                  await FileStorage.getFileFromAsset(
                      filename, context, isExistFile);
                }
              });
            }
          });
    } else {
      if (context.mounted) {
        await FileStorage.getFileFromAsset(filename, context, isExistFile);
      }
    }
  }

  static void downloadWidget(GlobalKey key, String fileName, BuildContext context) async {
    try {  
      final RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();

      await FileStorage.saveFile(pngBytes, fileName);
      if (context.mounted) {
        await FileStorage.getFileFromAsset(fileName, context, false);
      }
    } catch (e) {
      if (context.mounted) {
        ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
      }
    }
  }
}
