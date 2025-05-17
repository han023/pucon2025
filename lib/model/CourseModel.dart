class Course {
  final String uid;
  final String authorId;
  final String courseName;
  final String totalLessons;
  final String courseDuration;
  final String rating;
  final String description;
  final String skills; // JSON string
  final String reviews; // JSON string
  final String categoryName;
  final String categoryImage;

  Course({
    required this.uid,
    required this.authorId,
    required this.courseName,
    required this.totalLessons,
    required this.courseDuration,
    required this.rating,
    required this.description,
    required this.skills,
    required this.reviews,
    required this.categoryName,
    required this.categoryImage,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      uid: map['uid'] ?? '',
      authorId: map['authorId'] ?? '',
      courseName: map['courseName'] ?? '',
      totalLessons: map['totalLessons'] ?? '',
      courseDuration: map['courseDuration'] ?? '',
      rating: map['rating'] ?? '',
      description: map['description'] ?? '',
      skills: map['skills'] ?? '',
      reviews: map['reviews'] ?? '',
      categoryName: map['categoryName'] ?? '',
      categoryImage: map['categoryImage'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'uid': uid,
      'authorId': authorId,
      'courseName': courseName,
      'totalLessons': totalLessons,
      'courseDuration': courseDuration,
      'rating': rating,
      'description': description,
      'skills': skills,
      'reviews': reviews,
      'categoryName': categoryName,
      'categoryImage': categoryImage,
    };
  }
}
