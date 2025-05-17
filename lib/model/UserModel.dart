class UserModel {
  final String id;
  final String uid;
  final String email;
  final String cat;
  final String notificationId;
  final String name;
  final String number;
  final String img;

  const UserModel({
    this.id = "",
    required this.uid,
    required this.email,
    required this.cat,
    required this.notificationId,
    required this.name,
    required this.number,
    required this.img,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json, {
    required String docId,
  }) {
    return UserModel(
      id: docId,
      uid: json['uid'] as String,
      email: json['email'] as String,
      cat: json['cat'] as String,
      notificationId: json['notificationId'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      img: json['img'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'cat': cat,
      'notificationId': notificationId,
      'name': name,
      'number': number,
      'img': img,
    };
  }
}
