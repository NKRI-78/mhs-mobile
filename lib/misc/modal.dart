import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_alumni_model.dart';
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        height: 270.0,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20.0),
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
                                            const Text("Yakin")),
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
              ),
            ),
          );
        },
      );
    });
  }

  static Future<void> showResult({
    required String msg,
    required BuildContext context,
    required String locationImage,
  }) async {
    showAnimatedDialog(
    barrierDismissible: true,
    alignment: Alignment.bottomCenter,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        height: 270.0,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20.0),
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
                              const SizedBox(height: 30.0),
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
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
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
        return AlertDialog(
            scrollable: true,
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            contentPadding: EdgeInsets.zero,
            backgroundColor: whiteColor,
            content: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: 370,
                height: 580,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ImageCard(
                          image: testimoni.imageUrl ?? "", 
                          radius: 50,
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.fill,
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
                            textAlign: TextAlign.center,
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
            ),
        );
      },
      animationType: DialogTransitionType.scale,
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: const Duration(seconds: 1),
    );
  }

  static Future<void> showDetailPayment ({required BuildContext context,}) async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      context: context, 
      builder: (context) {
        return Wrap(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Perhatian !",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Untuk pembayaran ",
                          style: TextStyle(
                            color: blackColor,
                            fontSize: fontSizeDefault,
                          )
                        ),
                        TextSpan(
                          text: "Virtual Account",
                          style: TextStyle(
                            color: blackColor,
                            fontSize: fontSizeDefault,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class DetailCheckIn extends StatelessWidget {
  const DetailCheckIn({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                color: whiteColor,
                fontSize: fontSizeDefault,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              text,
              style: const TextStyle(
                color: whiteColor,
                fontSize: fontSizeDefault,
              ),
            ),
          ),
        ],
      ),
    );
  }
}