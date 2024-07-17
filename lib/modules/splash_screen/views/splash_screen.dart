import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
import 'package:mhs_mobile/widgets/background/scaffold_splash.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

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
                child: Image.asset(
                  logoMhs,
                  scale: 2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}