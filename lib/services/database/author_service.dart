import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pucon2025/model/Author.dart';

class AuthorService {
  final CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection("authors");

  Future<Author> getAuthor(String id) async {
    final QuerySnapshot query =
        await firestore.where('uid', isEqualTo: id).limit(1).get();
    final doc = query.docs.first;
    final data = doc.data() as Map<String, dynamic>;

    return Author.fromMap(data);
  }
}
