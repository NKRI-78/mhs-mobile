import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';

class CarListUser extends StatelessWidget {
  const CarListUser({
    super.key,
    required this.title, required this.detail,
  });

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: whiteColor),
        color: whiteColor.withOpacity(0.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "$detail $title",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.w500,
                  color: whiteColor
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}