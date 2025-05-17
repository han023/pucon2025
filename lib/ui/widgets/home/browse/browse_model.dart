import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/database/author_service.dart';

class BrowseModel extends BaseViewModel {
  final author = locator<AuthorService>();

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
