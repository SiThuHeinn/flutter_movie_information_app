import 'dart:ffi';

import 'package:intl/intl.dart';

import '../../domain/entities/Movie.dart';

class MovieResponseBundle {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  MovieResponseBundle({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults
  });

  factory MovieResponseBundle.fromJson(Map<String, dynamic> json){
    return MovieResponseBundle(
      page: json["page"],
      movies: List<Movie>.from(json["results"].map((x) => MovieResponse.fromJson(x).toModel())),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  MovieBundle toModel() {
    return MovieBundle(
      page: page,
      movies: movies,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }

}

class MovieResponse {
    MovieResponse({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    final bool? adult;
    final String? backdropPath;
    final List<int> genreIds;
    final int? id;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final DateTime? releaseDate;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    factory MovieResponse.fromJson(Map<String, dynamic> json){ 
        return MovieResponse(
            adult: json["adult"],
            backdropPath: json["backdrop_path"],
            genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
            id: json["id"],
            originalLanguage: json["original_language"],
            originalTitle: json["original_title"],
            overview: json["overview"],
            popularity: json["popularity"],
            posterPath: json["poster_path"],
            releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
            title: json["title"],
            video: json["video"],
            voteAverage: json["vote_average"],
            voteCount: json["vote_count"],
        );
    }


  Movie toModel() {
    return Movie(
      id: id ?? 0,
      overview: overview ?? "",
      posterPath: posterPath ?? "",
      backdropPath: backdropPath ?? "",
      title: title ?? "",
      voteAverage: voteAverage ?? 0.0,
      releaseDate: DateFormat("dd MMM yyyy").format(releaseDate ?? DateTime.now()),
    );
  }


}
