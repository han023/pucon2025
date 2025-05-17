import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(child: viewModel.pages[viewModel.currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white,
        unselectedItemColor: grey,
        selectedItemColor: primary,
        iconSize: 40,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.currentIndex,
        onTap: (index) => viewModel.updateIndex(index),
        items: viewModel.bttomBarItemList,
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
