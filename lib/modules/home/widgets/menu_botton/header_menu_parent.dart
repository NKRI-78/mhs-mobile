import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class HeaderMenuParent extends StatelessWidget {
  const HeaderMenuParent({super.key});

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
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/icon-report.png",
                    width: 30,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Laporan Siswa",
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
