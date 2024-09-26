import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

class HeaderMenuStudent extends StatelessWidget {
  const HeaderMenuStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  enabledMouseCursor: MouseCursor.defer,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)))),
              onPressed: () {
                ListModulRoute().go(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/module-icon.png",
                    width: 30,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Modul",
                    style: TextStyle(
                        fontSize: fontSizeExtraLarge,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 50,
          child: VerticalDivider(
            color: whiteColor,
            thickness: 2,
            width: 2,
          ),
        ),
        Expanded(
          flex: 2,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  enabledMouseCursor: MouseCursor.defer,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20)))),
              onPressed: () {
                ShowSnackbar.snackbar(context, "Fitur ini belum tersedia...", '', errorColor);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/absen-icon.png",
                    width: 30,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Absensi",
                    style: TextStyle(
                        fontSize: fontSizeExtraLarge,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
