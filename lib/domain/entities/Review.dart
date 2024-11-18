

class Review {
  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  final String author;
  final Author? authorDetails;
  final String content;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;
  final String url;

}

class Author {
  Author({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  final String name;
  final String username;
  final String avatarPath;
  final double rating;
}
