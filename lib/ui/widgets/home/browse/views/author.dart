import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/model/Author.dart';
import 'package:pucon2025/ui/common/constants/helper_functions.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/common/heading.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/listview/autorview.dart';

import '../browse_model.dart';

Widget author(BuildContext context, BrowseModel viewModel) {
  return Column(
    children: [
      HeadingBrowse("Top Authors"),
      SizedBox(
        height: 105,
        child: FirestoreListView<Map<String, dynamic>>(
          query: viewModel.author.firestore,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          loadingBuilder: (context) =>
              Center(child: displaysimpleprogress(context)),
          itemBuilder: (context, snapshot) {
            final data = snapshot.data();
            final author = Author.fromMap(data);

            return AuthorView(context, viewModel, author);
          },
        ),
      ),
    ],
  );
}
