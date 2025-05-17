import 'package:flutter/cupertino.dart';
import 'package:pucon2025/services/database/course_service.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/database/author_service.dart';

class BrowseModel extends BaseViewModel {
  final author = locator<AuthorService>();
  final course = locator<CourseService>();

  TextEditingController search = TextEditingController();

  String selectedCategory = "Business";
  List<String> categories = [
    "Business",
    "History",
    "Politics",
    "Language",
    "Literature"
  ];
  void updateCategory(String item) {
    selectedCategory = item;
    notifyListeners();
  }
}
