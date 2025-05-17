import 'package:cloud_firestore/cloud_firestore.dart';


class NotificationService {

  final CollectionReference<Map<String, dynamic>> firestore =
  FirebaseFirestore.instance.collection("notifications");
}
