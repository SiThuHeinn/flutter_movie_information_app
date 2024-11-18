

import 'package:movie_info/domain/entities/Review.dart';

class ReviewResponse {
  ReviewResponse({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  factory ReviewResponse.fromJson(Map<String, dynamic> json){
    return ReviewResponse(
      author: json["author"],
      authorDetails: json["author_details"] == null ? null : AuthorDetails.fromJson(json["author_details"]),
      content: json["content"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      url: json["url"],
    );
  }



  Review toModel() {
    return Review(
      author: author ?? "",
      authorDetails: authorDetails?.toModel(),
      content: content ?? "",
      createdAt: createdAt ?? DateTime.now(),
      id: id ?? "",
      updatedAt: updatedAt ?? DateTime.now(),
      url: url ?? "",
    );

  }

}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  factory AuthorDetails.fromJson(Map<String, dynamic> json){
    return AuthorDetails(
      name: json["name"],
      username: json["username"],
      avatarPath: json["avatar_path"],
      rating: json["rating"],
    );
  }

  Author toModel() {
    return Author(
      name: name ?? "",
      username: username ?? "",
      avatarPath: avatarPath ?? "",
      rating: rating ?? 0,
    );
  }

}
