class UserModel {
  final String id;
  final String uid;
  final String email;
  final String notificationId;
  final String name;

  const UserModel({
    this.id = "",
    required this.uid,
    required this.email,
    required this.notificationId,
    required this.name,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json, {
    required String docId,
  }) {
    return UserModel(
      id: docId,
      uid: json['uid'] as String,
      email: json['email'] as String,
      notificationId: json['notificationId'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'notificationId': notificationId,
      'name': name,
    };
  }
}
