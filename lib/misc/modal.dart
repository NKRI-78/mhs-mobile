import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mhs_mobile/misc/theme.dart';

class GeneralModal {
  static Future<void> showConfirmModal({
    required String msg,
    required BuildContext context,
    required void Function() onPressed,
    required String locationImage,
  }) async {
    showAnimatedDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: CustomDialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              minWidth: 180.0,
              child: Transform.rotate(
                angle: 0.0,
                child: Container(
                decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: whiteColor, width: 1.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.rotate(
                          angle: 56.5,
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            height: 270.0,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                left: 25.0,
                                right: 25.0,
                                bottom: 10.0),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  locationImage,
                                  width: 120.0,
                                  height: 120.0,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 15.0),
                                Text(msg,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: fontSizeLarge,
                                        color: blackColor)),
                                const SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: onPressed,
                                          child:
                                              const Text("Lanjutkan")),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/icons/close-icon.png",
                              width: 15,
                              height: 15,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
              ),
            ),
          );
        },
      );
    });
  }
}