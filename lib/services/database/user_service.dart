import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pucon2025/services/fcmnoification_service.dart';

import '../../app/app.locator.dart';
import '../../model/UserModel.dart';
import '../../ui/common/constants/app_strings.dart';
import '../localstorage_service.dart';

class UserService {
  final CollectionReference<Map<String, dynamic>> _firestore =
      FirebaseFirestore.instance.collection("user");

  final _fcm = locator<FcmnoificationService>();
  final _localstorage = locator<LocalstorageService>();

  Future<UserModel?> getUserDetailViaEmail(String email) async {
    final QuerySnapshot query =
        await _firestore.where('email', isEqualTo: email).limit(1).get();

    if (query.docs.isEmpty) {
      return null;
    }

    final doc = query.docs.first;
    final data = doc.data() as Map<String, dynamic>;

    return UserModel.fromJson(data, docId: doc.id);
  }

  Future<void> saveNewUser(UserModel data) async {
    await _firestore.add(data.toJson());
  }

  Future<bool> findUser(String email) async {
    final QuerySnapshot query =
        await _firestore.where('email', isEqualTo: email).limit(1).get();
    if (query.docs.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> updateNotificationId(String id) async {
    String? token = await _fcm.fcmToken();
    _localstorage.setString(notificatioid, token!);
    _firestore.doc(id).update({"notificatioid": token});
  }
}
