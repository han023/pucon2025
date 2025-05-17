import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../constants/helper_functions.dart';
import '../constants/ui_helpers.dart';

Widget showImageFromNetwork(String img){
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: CachedNetworkImage(
        imageUrl: img,
        imageBuilder: (context, imageProvider) => Container(
          width: screenWidthCustom(context, 0.1),
          height: screenWidthCustom(context, 0.1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => displaysimpleprogress(context),
        errorWidget: (context, url, error) => Image.asset(
          "assets/a1.jpg",
          width: screenWidthCustom(context, 0.1),
          height: screenWidthCustom(context, 0.1),
          fit: BoxFit.cover,
        )),
  );
}