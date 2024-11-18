

import 'package:intl/intl.dart';
import 'package:movie_info/domain/entities/People.dart';

class PeopleResponseBundle {
  final int page;
  final List<PeopleResponse> results;
  final int totalPages;
  final int totalResults;

  PeopleResponseBundle({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
  });

  factory PeopleResponseBundle.fromJson(Map<String, dynamic> json){
    return PeopleResponseBundle(
      page: json["page"],
      results: List<PeopleResponse>.from(json["results"].map((x) => PeopleResponse.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  PeopleBundle toModel() {
    return PeopleBundle(
      page: page,
      results: results.map((e) => e.toModel()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

class PeopleResponse {
  PeopleResponse({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.knownFor,
  });

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final List<KnownForResponse> knownFor;

  factory PeopleResponse.fromJson(Map<String, dynamic> json){
    return PeopleResponse(
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      originalName: json["original_name"],
      popularity: json["popularity"],
      profilePath: json["profile_path"],
      knownFor: json["known_for"] == null ? [] : List<KnownForResponse>.from(json["known_for"]!.map((x) => KnownForResponse.fromJson(x))),
    );
  }

  People toModel() {
    return People(
      adult: adult ?? false,
      gender: gender ?? 0,
      id: id ?? 0,
      knownForDepartment: knownForDepartment ?? "",
      name: name ?? "",
      originalName: originalName ?? "",
      popularity: popularity ?? 0.0,
      profilePath: profilePath ?? "",
      knownFor: knownFor.map((e) => e.toModel()).toList(),
    );
  }

}

class KnownForResponse {
  KnownForResponse({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
    required this.originCountry,
  });

  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? name;
  final String? originalName;
  final DateTime? firstAirDate;
  final List<String> originCountry;

  factory KnownForResponse.fromJson(Map<String, dynamic> json){
    return KnownForResponse(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      title: json["title"] ?? json["name"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      mediaType: json["media_type"],
      adult: json["adult"],
      originalLanguage: json["original_language"],
      genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
      popularity: json["popularity"],
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      video: json["video"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      name: json["name"],
      originalName: json["original_name"],
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
    );
  }

  KnownFor toModel() {
    return KnownFor(
      backdropPath: backdropPath ?? "",
      id: id ?? 0,
      title: title ?? "",
      originalTitle: originalTitle ?? "",
      overview: overview ?? "",
      posterPath: posterPath ?? "",
      mediaType: mediaType ?? "",
      adult: adult ?? false,
      originalLanguage: originalLanguage ?? "",
      genreIds: genreIds ?? [],
      popularity: popularity ?? 0.0,
      releaseDate: DateFormat("dd MMM yyyy").format(releaseDate ?? DateTime.now()),
      video: video ?? false,
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
      name: name ?? "",
      originalName: originalName ?? "",
      firstAirDate: DateFormat("dd MMM yyyy").format(firstAirDate ?? DateTime.now()),
      originCountry: originCountry ?? [],
    );
  }

}
