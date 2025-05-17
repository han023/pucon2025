import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

// Padding and margin sizes
const double padding4 = 4.0;
const double padding8 = 8.0;
const double padding10 = 10.0;
const double padding12 = 12.0;
const double padding14 = 14.0;
const double padding16 = 16.0;
const double padding24 = 24.0;
const double padding32 = 32.0;

// Icon sizes
const double icon12 = 12.0;
const double icon16 = 16.0;
const double icon24 = 24.0;
const double icon32 = 32.0;

// Button sizes
const double buttonHeight = 18.0;
const double buttonRadius = 12.0;
const double buttonWidth = 120.0;
const double buttonElevation = 4.0;

// AppBar height
const double appBarHeight = 56.0;

// Image sizes
const double imageThumbSize = 80.0;

// Default spacing between sections
const double defaultSpace = 24.0;
const double spaceBtwItems = 16.0;
const double spaceBtwSections = 32.0;

// Border radius
const double borderRadiusSm = 4.0;
const double borderRadiusMd = 8.0;
const double borderRadiusLg = 12.0;

// Divider height
const double dividerHeight = 1.0;

// Product item dimensions
const double productImageSize = 120.0;
const double productImageRadius = 16.0;
const double productItemHeight = 160.0;

// Input field
const double inputFieldRadius = 12.0;
const double spaceBtwInputFields = 16.0;

// Card sizes
const double cardRadiusLg = 16.0;
const double cardRadiusMd = 12.0;
const double cardRadiusSm = 10.0;
const double cardRadiusXs = 6.0;
const double cardElevation = 2.0;

// Font sizes
const double fontSize2 = 2.0;
const double fontSize4 = 4.0;
const double fontSize6 = 6.0;
const double fontSize8 = 8.0;
const double fontSize10 = 10.0;
const double fontSize12 = 12.0;
const double fontSize14 = 14.0;
const double fontSize16 = 16.0;
const double fontSize18 = 18.0;
const double fontSize20 = 20.0;
const double fontSize22 = 22.0;
const double fontSize24 = 24.0;
const double fontSize26 = 26.0;
const double fontSize28 = 28.0;
const double fontSize30 = 30.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthCustom(BuildContext context, double val) {
  return screenWidth(context) * val;
}

double screenHeightCustom(BuildContext context, double val) {
  return screenHeight(context) * val;
}

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

Future<void> setStatusBarColor(Color color) async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: color),
  );
}

bool isLandscapeOrientation(BuildContext context) {
  final viewInsets = View.of(context).viewInsets;
  return viewInsets.bottom == 0;
}

bool isPortraitOrientation(BuildContext context) {
  final viewInsets = View.of(context).viewInsets;
  return viewInsets.bottom != 0;
}

void setFullScreen(bool enable) {
  SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
}

double getPixelRatio(BuildContext context) {
  return MediaQuery.of(context).devicePixelRatio;
}

double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double getBottomNavigationBarHeight() {
  return kBottomNavigationBarHeight;
}

double getAppBarHeight() {
  return kToolbarHeight;
}

double getKeyboardHeight(BuildContext context) {
  final viewInsets = MediaQuery.of(context).viewInsets;
  return viewInsets.bottom;
}

Future<bool> isKeyboardVisible(BuildContext context) async {
  final viewInsets = View.of(context).viewInsets;
  return viewInsets.bottom > 0;
}

Future<bool> isPhysicalDevice() async {
  return defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}

void vibrate(Duration duration) {
  HapticFeedback.vibrate();
  Future.delayed(duration, () => HapticFeedback.vibrate());
}

Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations) async {
  await SystemChrome.setPreferredOrientations(orientations);
}

void hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

void showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
}

Future<bool> hasInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

bool isIOS() {
  return Platform.isIOS;
}

bool isAndroid() {
  return Platform.isAndroid;
}

Future<void> urllaunch(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
