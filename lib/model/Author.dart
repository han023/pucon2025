class Author {
  final String uid;
  final String authorImage;
  final String name;
  final String subject;
  final double rating;
  final int followersCount;
  final int followingCount;
  final String about;
  final String facebook;
  final String twitter;
  final String instagram;

  Author({
    required this.uid,
    required this.authorImage,
    required this.name,
    required this.subject,
    required this.rating,
    required this.followersCount,
    required this.followingCount,
    required this.about,
    required this.facebook,
    required this.twitter,
    required this.instagram,
  });

  factory Author.fromMap(Map<String, dynamic> data) {
    return Author(
      uid: data['uid'] ?? '',
      authorImage: data['authorImage'] ?? '',
      name: data['name'] ?? '',
      subject: data['subject'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      followersCount: data['followersCount'] ?? 0,
      followingCount: data['followingCount'] ?? 0,
      about: data['about'] ?? '',
      facebook: data['facebook'] ?? '',
      twitter: data['twitter'] ?? '',
      instagram: data['instagram'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'authorImage': authorImage,
      'name': name,
      'subject': subject,
      'rating': rating,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'about': about,
      'facebook': facebook,
      'twitter': twitter,
      'instagram': instagram,
    };
  }
}