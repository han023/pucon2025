import 'package:flutter/cupertino.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';

import '../browse_model.dart';
import 'common/heading.dart';

Widget popularSkills(BuildContext context, BrowseModel viewModel) {
  return Column(
    children: [
      HeadingBrowse("Popular Skills"),
      Row(
        children: [
          popularItem(context, "assets/c3.jpg"),
          popularItem(context, "assets/c2.jpg")
        ],
      ),
      Row(
        children: [
          popularItem(context, "assets/c1.jpg"),
          popularItem(context, "assets/c3.jpg")
        ],
      ),
    ],
  );
}

Widget popularItem(BuildContext context, String img) {
  return Padding(
    padding: const EdgeInsets.all(padding10),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          img,
          width: screenWidthCustom(context, 0.4),
        )),
  );
}
