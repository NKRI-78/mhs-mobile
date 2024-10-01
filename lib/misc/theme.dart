import 'package:flutter/material.dart';

var baseDarkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff000000),
    background: Color(0xff000000),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: redColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

var baseTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: redColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

const redColor = Color(0xffFC0102);
const errorColor = Color(0xFF0DBE49);
const primaryColor = Color(0xff124AA0);
const yellowColor = Color(0xffFACF24);
const whiteColor = Color(0xffFFFFFF);
const greyDescColor = Color(0xff8C8C8C);
const greyColor = Color(0xffE8EDF6);
const successColor = Color(0xFF512DA8);
const greenColor = Color(0xFF0DBE49);
const orangeColor = Color(0xFFEC7D1E);
const blackColor = Color(0xFF070707);
const greyInputColor = Color(0xFFC7C7C7);
const circleUnselect = Color(0xFFECECEC);
const circleSelect = Color(0xFFBBBBBB);
const testimoniColor = Color(0xFFE3FCFE);

//images
const String logoMhs = "assets/images/logo.png";
const String logoMhsNoText = "assets/images/logo-no-text.png";
const String imageDefault = "assets/images/no_image.png";
const String circleTop = "assets/images/circle_background_top.png";
const String circleDown = "assets/images/circle_background_bottom.png";
const String circleDownMenu = "assets/icons/circle-down-menu.png";
const String completedSuccessfully = "assets/icons/completed-successfully.png";
const String circleFull = "assets/images/circle_background_full.png";
const String inovatifLogo = "assets/images/logo-inovatif.png";
const String bottomInfo = "assets/images/bottom_info.png";
const String avatarDefault = "assets/images/default.jpg";

//icons
const String backIcon = "assets/icons/back-icon.png";
const String logoutIcon = "assets/icons/shutdown-button.png";

//Font Size
const double fontSizeOverExtraSmall = 9.0;
const double fontSizeExtraSmall = 10.0;
const double fontSizeSmall = 12.0;
const double fontSizeDefault = 14.0;
const double fontSizeLarge = 16.0;
const double fontSizeExtraLarge = 18.0;
const double fontSizeOverLarge = 22.0;
const double fontSizeTitle = 32.0;
