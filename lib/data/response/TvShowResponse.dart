import 'package:intl/intl.dart';
import 'package:movie_info/domain/entities/TvShow.dart';


class TvShowResponseBundle {
  final int page;
  final List<TvShowResponse> tvShows;
  final int totalPages;
  final int totalResults;

  TvShowResponseBundle({
    required this.page,
    required this.tvShows,
    required this.totalPages,
    required this.totalResults
  });

  factory TvShowResponseBundle.fromJson(Map<String, dynamic> json){
    return TvShowResponseBundle(
      page: json["page"],
      tvShows: List<TvShowResponse>.from(json["results"].map((x) => TvShowResponse.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  TvShowBundle toModel() {
    return TvShowBundle(
      page: page,
      tvShows: tvShows.map((e) => e.toModel()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}



class TvShowResponse {
  TvShowResponse({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int? id;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  factory TvShowResponse.fromJson(Map<String, dynamic> json){
    return TvShowResponse(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      name: json["name"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }


  TvShow toModel() {
    return TvShow(
      adult: adult ?? false,
      backdropPath: backdropPath ?? "",
      genreIds: genreIds,
      id: id ?? 0,
      originCountry: originCountry,
      originalLanguage: originalLanguage ?? "",
      originalName: originalName ?? "",
      overview: overview ?? "",
      popularity: popularity ?? 0.0,
      posterPath: posterPath ?? "",
      firstAirDate: DateFormat("dd MMM yyyy").format(firstAirDate!) ?? "",
      name: name ?? "",
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }



}
