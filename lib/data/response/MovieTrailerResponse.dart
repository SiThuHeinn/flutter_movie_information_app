

import 'package:movie_info/domain/entities/MovieTrailer.dart';

class MovieTrailerResponse {
  MovieTrailerResponse({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.publishedAt,
    required this.official,
    required this.id,
  });

  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final DateTime? publishedAt;
  final bool? official;
  final String? id;

  factory MovieTrailerResponse.fromJson(Map<String, dynamic> json){
    return MovieTrailerResponse(
      iso6391: json["iso_639_1"],
      iso31661: json["iso_3166_1"],
      name: json["name"],
      key: json["key"],
      site: json["site"],
      size: json["size"],
      type: json["type"],
      publishedAt: DateTime.tryParse(json["published_at"] ?? ""),
      official: json["official"],
      id: json["id"],
    );
  }


  MovieTrailer toModel() {
    return MovieTrailer(
      iso6391: iso6391 ?? "",
      iso31661: iso31661 ?? "",
      name: name ?? "",
      key: key ?? "",
      site: site ?? "",
      size: size ?? 0,
      type: type ?? "",
      publishedAt: publishedAt ?? DateTime.now(),
      official: official ?? false,
      id: id ?? "",
    );
  }

}
