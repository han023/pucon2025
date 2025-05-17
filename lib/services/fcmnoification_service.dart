import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;

class FcmnoificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String?> fcmToken() async {
    return await _messaging.getToken();
  }

  static Future<void> sendPushMessage(
      String recipientToken, String title, String body) async {
    try {
      final jsonCredentials =
          await rootBundle.loadString('assets/pucon2025.json');
      final creds = auth.ServiceAccountCredentials.fromJson(jsonCredentials);
      final client = await auth.clientViaServiceAccount(
        creds,
        ['https://www.googleapis.com/auth/cloud-platform'],
      );

      const String projectId = 'pucon2025-bb8f0';

      final notificationData = {
        'message': {
          'token': recipientToken,
          'notification': {'title': title, 'body': body}
        },
      };

      await client.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/$projectId/messages:send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(notificationData),
      );

      client.close();
    } catch (e) {
      rethrow;
    }
  }
}
