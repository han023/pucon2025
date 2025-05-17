import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/text_helper.dart';

Widget signupTop(BuildContext context){
  return Stack(
    children: [
      Image.asset(
        'assets/signUp.png',
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
                colors: [white.withOpacity(0), black])),
      ),
      Positioned(
        bottom: 0,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              text_helper(
                data: "Welcome User",
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                color: white,
                size: fontSize30,
              ),
              verticalSpaceMedium,
              text_helper(
                data: "Sign up to join",
                textAlign: TextAlign.start,
                color: white,
              )
            ],
          ),
        ),
      )
    ],
  ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0);
}