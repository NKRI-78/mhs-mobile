import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class BackgroundHomeScafold extends StatelessWidget {
  const BackgroundHomeScafold({
    super.key,
    required this.child,
    this.gk,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
  });

  final Widget child;

  final GlobalKey<ScaffoldState>? gk;

  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: gk,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Container(
              color: primaryColor,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  circleTop,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Image.asset(
                    circleDown,
                    height: 200,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned.fill(child: child),
          ],
        ));
  }
}
