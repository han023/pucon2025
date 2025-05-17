import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';

import 'notifications_model.dart';

class Notifications extends StackedView<NotificationsModel> {
  const Notifications({super.key});

  @override
  Widget builder(
    BuildContext context,
    NotificationsModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpaceSmall,
                const Icon(
                  Icons.filter_alt,
                  size: 20,
                ),
                verticalSpaceTiny,
                text_helper(
                  data: "Notifications",
                  font: sourceserif,
                  fontWeight: FontWeight.bold,
                  size: fontSize22,
                )
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 10,
                ),
              ],
            )
          ],
        ),
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.notifications.isEmpty
              ? Center(
                  child: text_helper(
                    data: 'No notifications yet',
                    color: darkGrey,
                    size: fontSize14,
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding16, vertical: padding10),
                  itemCount: viewModel.notifications.length,
                  separatorBuilder: (_, __) => const Divider(color: grey),
                  itemBuilder: (context, index) {
                    final notification = viewModel.notifications[index];

                    return Container(
                      padding: const EdgeInsets.all(padding12),
                      decoration: BoxDecoration(
                        color: notification.isRead ? white : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          viewModel.markAsRead(notification.id);
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(notification.image),
                              backgroundColor: grey.withOpacity(0.2),
                            ),
                            horizontalSpaceMedium,

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text_helper(
                                    data: notification.title,
                                    fontWeight: FontWeight.bold,
                                    size: fontSize14,
                                    color: black,
                                    textAlign: TextAlign.start,
                                  ),
                                  verticalSpaceTiny,
                                  text_helper(
                                    data: notification.body,
                                    color: darkGrey,
                                    size: fontSize12,
                                    textAlign: TextAlign.start,
                                  ),
                                  verticalSpaceTiny,
                                  text_helper(
                                    data: timeAgo(notification.timestamp),
                                    color: grey,
                                    size: fontSize10,
                                  ),
                                ],
                              ),
                            ),

                            // Action button
                            if (notification.authorId.isNotEmpty)
                              IconButton(
                                icon: const Icon(Icons.person_add_alt_1),
                                color: primary,
                                onPressed: () {
                                  // Handle follow author action
                                },
                              ),
                          ],
                        ),
                      ),
                    )
                        .animate(delay: (index * 200).ms)
                        .fade()
                        .moveY(begin: 50, end: 0);
                  },
                ),
    );
  }

  @override
  void onViewModelReady(NotificationsModel viewModel) {
    viewModel.fetchNotifications();
    super.onViewModelReady(viewModel);
  }

  @override
  NotificationsModel viewModelBuilder(BuildContext context) =>
      NotificationsModel();
}

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays > 30) {
    return '${(difference.inDays / 30).floor()} months ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} days ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}
