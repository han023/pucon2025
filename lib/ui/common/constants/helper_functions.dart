import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../theme/app_colors.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
  return DateFormat(format).format(date);
}

List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
}

List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
  final wrappedList = <Widget>[];
  for (var i = 0; i < widgets.length; i += rowSize) {
    final rowChildren = widgets.sublist(
        i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
    wrappedList.add(Row(children: rowChildren));
  }
  return wrappedList;
}

ScaffoldFeatureController show_snackbar(BuildContext context, String text,
    {Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    ),
  );
}

Widget displaysimpleprogress(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(
      strokeWidth: 6.0,
      valueColor: AlwaysStoppedAnimation<Color>(primary),
    ),
  );
}

void displayprogress(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 6.0,
            valueColor: AlwaysStoppedAnimation<Color>(primary),
          ),
        ),
      );
    },
  );
}

void hideprogress(BuildContext context) {
  Navigator.pop(context);
}

Future<File?> picimage({imageSource = ImageSource.gallery}) async {
  final pickedFile = await ImagePicker().pickImage(source: imageSource);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

Widget imageformurl(String url,
    {width = 0.2, height = 0.2, double radius = 0}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: screenWidthCustom(context, width),
        height: screenWidthCustom(context, height),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    placeholder: (context, url) => displaysimpleprogress(context),
    errorWidget: (context, url, errorr) => const Icon(
      Icons.error,
      color: error,
    ),
  );
}

Future<String> selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 30)),
  );
  return pickedDate!.toLocal().toLocal().toString().split(' ')[0];
}

Future<String> selectTime(BuildContext context, bool c) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  return pickedTime!.format(context);
}

void navigateToView(Widget view, String routeName, {bool clearStack = false}) {
  final navigationService = locator<NavigationService>();
  if (clearStack) {
    navigationService.clearStackAndShow(routeName);
  }
  navigationService.navigateWithTransition(view,
      routeName: routeName, transitionStyle: Transition.rightToLeft);
}

String datee(dynamic document) {
  DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
    document.seconds * 1000 + document.nanoseconds ~/ 1000000,
  );
  return timestamp.toString().substring(0, 10);
}

Future<Position?> getCurrentLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true,
    );
    return position;
  } catch (e) {
    return null;
  }
}
