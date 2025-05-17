import 'package:flutter/cupertino.dart';
import 'package:pucon2025/services/database/course_service.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/database/author_service.dart';

class MycourseModel extends BaseViewModel {
  final author = locator<AuthorService>();
  final course = locator<CourseService>();


  TextEditingController search = TextEditingController();

  void cancle() {
    search.clear();
    notifyListeners();
  }

  void addSearch(String title) {
    search.text = title;
    notifyListeners();
  }

  List<String> topSearch = [
    "History",
    "Sport",
    "Art",
    "Entertainment",
    "Outdoor",
    "Music",
    "Social",
    "Nightlife",
    "Concerts",
    "Health",
    "Submarine"
  ];
}
