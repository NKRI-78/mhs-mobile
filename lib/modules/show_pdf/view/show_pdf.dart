import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_prevent_screen_capture/flutter_prevent_screen_capture.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:no_screenshot/no_screenshot.dart';

class ShowPdf extends StatefulWidget {
  const ShowPdf({super.key, required this.linkPdf, required this.title});

  final String linkPdf;
  final String title;

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  ///Define a streamSubscription in order to receive changes
  late StreamSubscription<bool> _screenRecordsSubscription;

  ///Get the instance of plugin for multiple use.
  FlutterPreventScreenCapture preventScreenCapture = FlutterPreventScreenCapture();

  ///is Recording is set to false initially.
  bool isRecording = false;

  final _noScreenshot = NoScreenshot.instance;

  void stopScreenshotListening() async {
    await _noScreenshot.screenshotOff();
  }
  void startScreenshotListening() async {
    await _noScreenshot.screenshotOn();
  }


  secureAndroid() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  unSecureAndroid() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  updateRecordStatus(bool record) {
    isRecording = record;
    setState(() {});
  }

Future<void> checkScreenRecord() async {
    final recordStatus = await preventScreenCapture.checkScreenRecord();

    debugPrint('Is screen being recorded: $recordStatus');

    isRecording = recordStatus;
    setState(() {});
 }
 

  @override
  initState(){
    if(Platform.isAndroid){
      // secureAndroid();
      stopScreenshotListening();
    }else {
      checkScreenRecord();
    }
    _screenRecordsSubscription = preventScreenCapture.screenRecordsIOS.listen(updateRecordStatus);
    super.initState();
  }

  @override
  void dispose() {
    if(Platform.isAndroid){
      startScreenshotListening();
      // unSecureAndroid();
    }else {
      _screenRecordsSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: greyColor,
                size: fontSizeLarge,
              )),
          toolbarHeight: 90,
          title: Container(
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.title,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: whiteColor,
                              fontSize: fontSizeOverLarge,
                              fontFamily: 'SF Pro'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ),
      body: isRecording ? const SizedBox.shrink() : SfPdfViewer.network(
        widget.linkPdf,
        enableTextSelection: false,
      ),
    );
  }
}