import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/author.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/browse_top.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/pouplar_skills.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/recommended_course.dart';
import 'package:stacked/stacked.dart';

import 'browse_model.dart';

class Browse extends StackedView<BrowseModel> {
  const Browse({super.key});

  @override
  Widget builder(
    BuildContext context,
    BrowseModel viewModel,
    Widget? child,
  ) {
    return ListView(
      children: [
        browseTop(context, viewModel),
        Padding(
          padding: const EdgeInsets.all(padding16),
          child: Column(
            children: [
              author(context, viewModel),
              verticalSpaceMedium,
              RecommendedCourse(context, viewModel),
              verticalSpaceMedium,
              popularSkills(context, viewModel),
              verticalSpaceMedium,
            ],
          ),
        ),
      ],
    );
  }

  @override
  BrowseModel viewModelBuilder(
    BuildContext context,
  ) =>
      BrowseModel();
}
