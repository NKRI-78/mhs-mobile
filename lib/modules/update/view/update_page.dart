import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/helper.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/background/scaffold_splash.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key, required this.currentVersion, required this.newVersion});

  final String currentVersion;
  final String newVersion;

  @override
  Widget build(BuildContext context) {
    return ScaffoldSplash(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                circleFull,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        logoMhsNoText,
                        scale: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "VERSI TERBARU SUDAH TERSEDIA",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: fontSizeLarge
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Silahkan unduh versi terbaru pada Google Play Store.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: fontSizeLarge
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Helper.update(context);
                        }, 
                        child: const Text(
                          "Perbarui Aplikasi MHS"
                        )
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Current Version $currentVersion | New Version $newVersion",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: whiteColor,
                          fontSize: fontSizeSmall
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}