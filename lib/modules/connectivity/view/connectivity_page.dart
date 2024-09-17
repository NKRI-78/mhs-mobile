import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';

class NoConnectivityScreen extends StatelessWidget {
  const NoConnectivityScreen({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    // Image.asset(
                    //   logoMhs,
                    //   scale: 3,
                    // ),
                    const Icon(Icons.signal_wifi_off, size: 200, color: whiteColor,),
                    const SizedBox(height: 20,),
                    Text(
                      msg,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: whiteColor
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}