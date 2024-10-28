import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class NoConnectivityScreen extends StatelessWidget {
  const NoConnectivityScreen({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                circleFull,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      noConnection,
                      scale: 3,
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        msg,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: whiteColor
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}