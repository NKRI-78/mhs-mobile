import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

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

  static Future<void> showTestimoni({
    required BuildContext context,
    required TestimoniData testimoni,
  }) async {
    showAnimatedDialog(
      alignment: Alignment.center,
      context: context,
      barrierDismissible: true,
      barrierColor: blackColor.withOpacity(0.50),
      builder: (BuildContext context) {
        return CustomDialog(
          minWidth: 100,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: whiteColor,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ImageCard(
                      image: testimoni.imageUrl ?? "", 
                      radius: 50,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    testimoni.name ?? "",
                    style: const TextStyle(
                      color: blackColor,
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 15, right: 15, left: 15),
                  child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      child: Text(
                        testimoni.message ?? "",
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: fontSizeDefault,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}