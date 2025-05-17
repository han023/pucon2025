import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/home/account/account.dart';
import '../../widgets/home/bookmark/bookmark.dart';
import '../../widgets/home/browse/browse.dart';
import '../../widgets/home/mycourse/mycourse.dart';
import '../../widgets/home/notifications/notifications.dart';

class HomeViewModel extends BaseViewModel {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Browse(),
    const Mycourse(),
    const Bookmark(),
    const Notifications(),
    const Account(),
  ];

  List<BottomNavigationBarItem> bttomBarItemList = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Browser',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      label: 'My Course',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Bookmark',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Account',
    ),
  ];

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
