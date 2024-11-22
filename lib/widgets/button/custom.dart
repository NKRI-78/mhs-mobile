import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/button/bounce.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String? btnTxt;
  final bool customText;
  final Widget? text;
  final double width;
  final double height;
  final double sizeBorderRadius;
  final Color loadingColor;
  final Color btnColor;
  final Color btnTextColor;
  final Color btnBorderColor;
  final double fontSize;
  final bool isBorder;
  final bool isBorderRadius;
  final bool isLoading;
  final bool isBoxShadow;
  final bool isBackgroundImage;
  final bool isPrefixIcon;

  const CustomButton({
    super.key, 
    required this.onTap, 
    this.btnTxt, 
    this.customText = false,
    this.text,
    this.width = double.infinity,
    this.height = 45.0,
    this.fontSize = 14.0,
    this.sizeBorderRadius = 10.0,
    this.isLoading = false,
    this.loadingColor = whiteColor,
    this.btnColor = primaryColor,
    this.btnTextColor = whiteColor,
    this.btnBorderColor = Colors.transparent,
    this.isBorder = false,
    this.isBorderRadius = false,
    this.isBoxShadow = false,
    this.isBackgroundImage = false,
    this.isPrefixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: isLoading ? null : onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: isBackgroundImage
            ? const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/background/bg.png',
                )
              )
            : null,
          boxShadow: isBoxShadow 
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.0,
                blurRadius: 10.0,
                offset: const Offset(5.0, 5.0),
              )
            ]
          : [],
          color: btnColor,
          border: Border.all(
            color: isBorder 
            ? btnBorderColor 
            : Colors.transparent,
          ),
          borderRadius: isBorderRadius 
          ? BorderRadius.circular(sizeBorderRadius)
          : null
        ),
        child: isLoading 
        ? const Center(
            child: SpinKitThreeBounce(
              size: 25.0,
              color: whiteColor,
            ),
          )
        : Row(
            mainAxisAlignment: isPrefixIcon ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
            isPrefixIcon 
            ? const SizedBox(width: 15) 
            : const SizedBox(),
            isPrefixIcon
              ? Image.asset('assets/images/logo/logo.png',
                height: 48.0,
                width: 48.0,
              )
              : const SizedBox(),
            isPrefixIcon 
            ? const SizedBox(width: 15) 
            : const SizedBox(),
            customText
              ? text! 
              : Center(
                child: Text(btnTxt!,
                  style: TextStyle(
                    color: btnTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize
                  ) 
                ),
              ),
          ],
        )
      ),
    );
  }
}
