import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/scaffold_splash.dart';
import 'package:new_version_plus/new_version_plus.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  void navigateScreen() async {
    final app = getIt<AppBloc>();
    NewVersionPlus newVersion = NewVersionPlus(androidId: 'com.inovatif78.mhs_mobile', iOSId: 'com.inovatif78.mhs-mobile');
    final vs = await newVersion.getVersionStatus();
    if (mounted) {
      Future.delayed(Duration.zero, () {
         app.state.alreadyShowBeginingTour
            ? vs?.canUpdate ?? false ? UpdateRoute(
        currentVersion: vs?.localVersion ?? "", 
        newVersion: vs?.storeVersion ?? ""
      ).go(context) : HomeRoute().go(context)
        : BeginingTourRoute().go(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      navigateScreen();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
