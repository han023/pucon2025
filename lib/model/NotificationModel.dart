import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final String image;
  final String authorId;
  final DateTime timestamp;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.authorId,
    required this.timestamp,
    required this.isRead,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      id: doc.id,
      title: data['notificationTitle'] ?? '',
      body: data['notificationContent'] ?? '',
      image: data['notificationImage'] ?? '',
      authorId: data['authorId'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      isRead: data['read'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notificationTitle': title,
      'notificationContent': body,
      'notificationImage': image,
      'authorId': authorId,
      'timestamp': Timestamp.fromDate(timestamp),
      'read': isRead,
    };
  }
}
