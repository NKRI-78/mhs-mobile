import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, this.height = .75});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height!,
    child: const Center(
      child: CircularProgressIndicator.adaptive(),
    ));
  }
}