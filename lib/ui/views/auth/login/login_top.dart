import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/text_helper.dart';

Widget LoginTop(BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Image.asset(
        'assets/login.png',
        width: screenWidth(context),
        height: 280,
        fit: BoxFit.contain,
      ),
      Container(
        width: screenWidth(context),
        height: 280,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [white.withOpacity(0), black],
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 25,
        right: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text_helper(
              data: "Welcome\nBack",
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              color: white,
              size: fontSize30,
            ),
            text_helper(
              data: "Sign in to continue",
              textAlign: TextAlign.start,
              color: white,
            ),
          ],
        ),
      ),
    ],
  ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0);
}
