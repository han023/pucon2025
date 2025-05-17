import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/common/customwidget/button_helper.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';

final List<String> imgList = [
  'assets/c1.jpg',
  'assets/c2.jpg',
  'assets/c3.jpg',
];

Widget BrowseTopSlideShow(BuildContext context) {
  return CarouselSlider.builder(
    itemCount: imgList.length,
    options: CarouselOptions(
      height: 200,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
    ),
    itemBuilder: (context, index, realIdx) {
      return Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imgList[index],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text_helper(
                  data: 'Explore your future here',
                  font: sourceserif,
                  color: white,
                  fontWeight: FontWeight.bold,
                  size: fontSize16,
                ),
                text_helper(
                  data: 'Get 50% Discount',
                  font: sourceserif,
                  color: white,
                ),
                verticalSpaceSmall,
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50)),
                  child: text_helper(data: ""),
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}
