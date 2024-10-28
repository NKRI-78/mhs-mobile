import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/widgets/extension/date_util.dart';

class CardAbsence extends StatelessWidget {
  const CardAbsence({super.key, required this.absence});

  final AttendanceStudents absence;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364,
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateUntil.getFormatedDateWithHours(absence.createdAt ?? DateTime.now().toString()),
                  style: const TextStyle(
                    color: greyDescColor,
                    fontSize: fontSizeSmall
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Absensi anda telah ",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: fontSizeDefault
                        )
                      ),
                      TextSpan(
                        text: "Terverifikasi",
                        style: TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.w500,
                          fontSize: fontSizeDefault
                        )
                      ),
                    ]
                  )
                ),
                Text(
                  "Pada Hari ${DateUntil.getDay(absence.attendance?.date ?? "")}",
                  style: const TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSizeDefault
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalDivider(
                  color: greyColor,
                  thickness: 2,
                  width: 2,
                ),
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  ceklisIcon,
                  width: 44,
                  height: 44,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}