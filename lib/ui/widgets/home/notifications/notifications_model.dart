import 'package:stacked/stacked.dart';
import 'package:pucon2025/model/NotificationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  Future<void> fetchNotifications() async {
    setBusy(true);
    try {
      final snapshot = await _firestore
          .collection('notifications')
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
    await _firestore
        .collection('notifications')
        .doc(notificationId)
        .update({'read': true});
  }
}