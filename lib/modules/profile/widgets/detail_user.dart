import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';

class DetailUser extends StatelessWidget {
  const DetailUser({super.key, required this.email, required this.phone});

  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: 450,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          color: primaryColor
        ),
      child: Column(
        children: [
          CarListUser(detail: "Email:", title: email),
          CarListUser(detail: "Phone:", title: phone),
        ],
      ),
    );
  }
}

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
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: whiteColor),
        color: whiteColor.withOpacity(0.3)
      ),
      child: Row(
        children: [
          Text(
            detail,
            style: TextStyle(
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w500,
              color: whiteColor.withOpacity(0.80)
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w500,
              color: whiteColor
            ),
          ),
        ],
      ),
    );
  }
}