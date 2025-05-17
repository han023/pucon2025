import 'package:cloud_firestore/cloud_firestore.dart';

class AuthorService {
  final CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection("authors");
}
