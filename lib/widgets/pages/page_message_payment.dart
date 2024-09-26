import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class PageMessagePayment extends StatelessWidget {
  const PageMessagePayment({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                completedSuccessfully,
                width: 250.0,
                height: 250.0,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(msg,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: const TextStyle(
              color: blackColor,
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro')),
            ],
          ),
        ),
      ),
    );
  }
}