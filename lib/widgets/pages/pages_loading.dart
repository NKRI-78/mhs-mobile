import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mhs_mobile/misc/theme.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, this.height = .75});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height!,
    child: const Center(
      child: SpinKitThreeBounce(
        size: 25.0,
        color: primaryColor,
      ),
    ));
  }
}