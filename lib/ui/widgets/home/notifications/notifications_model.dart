import 'package:pucon2025/services/database/notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:pucon2025/model/NotificationModel.dart';

import '../../../../app/app.locator.dart';

class NotificationsModel extends BaseViewModel {
  final _notification = locator<NotificationService>();

  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  Future<void> fetchNotifications() async {
    setBusy(true);
    try {
      final snapshot = await _notification.firestore
          .orderBy('timestamp', descending: true)
          .get();

      _notifications = snapshot.docs
          .map((doc) => NotificationModel.fromFirestore(doc))
          .toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching notifications: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> markAsRead(String notificationId) async {
    await _notification.markAsRead(notificationId);
  }
}
