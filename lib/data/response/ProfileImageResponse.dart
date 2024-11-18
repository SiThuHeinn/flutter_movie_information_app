


import 'package:movie_info/domain/entities/ProfileImage.dart';

class ProfileImageResponse {
  ProfileImageResponse({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double? aspectRatio;
  final int? height;
  final dynamic iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  factory ProfileImageResponse.fromJson(Map<String, dynamic> json){
    return ProfileImageResponse(
      aspectRatio: json["aspect_ratio"],
      height: json["height"],
      iso6391: json["iso_639_1"],
      filePath: json["file_path"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      width: json["width"],
    );
  }

  ProfileImage toModel() {
    return ProfileImage(
      aspectRatio: aspectRatio ?? 0.0,
      height: height ?? 0,
      iso6391: iso6391,
      filePath: filePath ?? '',
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
      width: width ?? 0,
    );
  }

}
