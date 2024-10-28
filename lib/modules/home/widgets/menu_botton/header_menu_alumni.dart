import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

class HeaderMenuAlumni extends StatelessWidget {
  const HeaderMenuAlumni({super.key, required this.nameStudent});

  final String nameStudent;
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
              onPressed: () {
                nameStudent == "" ? AddTestimoniRoute().go(context) : ShowSnackbar.snackbar(context, "Anda sudah memberikan testimoni", '', errorColor);;
              },
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
                    "Buat Testimoni",
                    style: TextStyle(
                      fontSize: fontSizeExtraLarge,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
