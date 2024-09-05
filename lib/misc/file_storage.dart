import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      directory = Directory("/storage/emulated/0/Download");
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final exPath = directory.path;
    await Directory("$exPath/MHS-MOBILE").create(recursive: true);
    return exPath;
  }

  static Future<String> get localPath async {
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<String> getFileFromAsset(
      String filename, BuildContext context, bool isExistFile) async {
    final path = await localPath;
    debugPrint('Filename : $path/MHS-MOBILE/$filename');
    final snackBar = SnackBar(
      backgroundColor: isExistFile ? redColor : greenColor,
      duration: const Duration(seconds: 5),
      content: Text(
        "${isExistFile ? 'File sudah ada di ' : 'File berhasil diunduh, File disimpan di '} $path/MHS-MOBILE/$filename",
        style: const TextStyle(color: whiteColor, fontWeight: FontWeight.w700),
      ),
      action: SnackBarAction(
        label: 'Lihat',
        textColor: whiteColor,
        onPressed: () async {
          final result = await OpenFile.open('$path/MHS-MOBILE/$filename');
          Future.delayed(Duration.zero, () {
            result.type.name != "noAppToOpen"
                ? ShowSnackbar.snackbar(
                    context, "Berhasil membuka file", '', greenColor)
                : ShowSnackbar.snackbar(
                    context, result.message, '', redColor);
          });
        },
      ),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return "$path/MHS-MOBILE/$filename";
  }

  static Future<bool> checkFileExist(String filename) async {
    final path = await localPath;
    debugPrint('Filename : $filename');
    File file = File('$path/MHS-MOBILE/$filename');

    bool checkIsExist = await file.exists();
    if (checkIsExist) {
      return true;
    }

    return false;
  }

  static Future<File> saveFile(Uint8List bytes, String filename) async {
    final path = await localPath;
    debugPrint('Filename : $filename');
    File file = File('$path/MHS-MOBILE/$filename');
    return file.writeAsBytes(bytes);
  }
}
