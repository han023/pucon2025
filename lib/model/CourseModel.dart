class CourseModel {
  final String title;
  final String description;
  final String courseImage;
  final String authorId;
  final String price;
  final String rating;
  final String totalStudents;
  final String category;
  final String durationHours;

  CourseModel({
    required this.title,
    required this.description,
    required this.courseImage,
    required this.authorId,
    required this.price,
    required this.rating,
    required this.totalStudents,
    required this.category,
    required this.durationHours,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      courseImage: map['courseImage'] ?? '',
      authorId: map['authorId'] ?? '',
      price: map['price'] ?? '0',
      rating: map['rating'] ?? '0',
      totalStudents: map['totalStudents'] ?? '0',
      category: map['category'] ?? '',
      durationHours: map['durationHours'] ?? '0',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'courseImage': courseImage,
      'authorId': authorId,
      'price': price,
      'rating': rating,
      'totalStudents': totalStudents,
      'category': category,
      'durationHours': durationHours,
    };
  }
}