import 'package:cloud_firestore/cloud_firestore.dart';

class CourseService {
  final CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection("courses");
}
