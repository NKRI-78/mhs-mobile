import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';

enum BackgroundAssets { standart, welcome }

class CustomBackgroundScaffold extends StatelessWidget {
  const CustomBackgroundScaffold({
    super.key,
    required this.child,
    this.assets = BackgroundAssets.standart,
    this.gk,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
  });

  final Widget child;

  final GlobalKey<ScaffoldState>? gk;

  final BackgroundAssets assets;

  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;

  String get asset {
    if (assets == BackgroundAssets.welcome) {
      return 'assets/images/background_welcome.png';
    }
    return 'assets/images/background.png';
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: baseDarkTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          baseDarkTheme.textTheme,
        ),
      ),
      child: Scaffold(
          key: gk,
          drawer: drawer,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          body: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                asset,
                fit: BoxFit.cover,
              ),
              Positioned.fill(child: child),
            ],
          )),
    );
  }
}
