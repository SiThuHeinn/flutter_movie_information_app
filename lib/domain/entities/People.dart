

import '../../core/constants/api_url.dart';

class PeopleBundle {
  PeopleBundle({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<People> results;
  final int totalPages;
  final int totalResults;
}

class People {
  People({
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

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final List<KnownFor> knownFor;

  String profileUrl() {
    if (profilePath.isEmpty) {
      return ApiUrl.errorImagePath;
    } else {
      return '${ApiUrl.profileBasePath}$profilePath';
    }
  }

  double get roundedPopularity => (popularity * 10).roundToDouble() / 10;

}

class KnownFor {
  KnownFor({
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

  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String name;
  final String originalName;
  final String firstAirDate;
  final List<String> originCountry;

  String getFullPosterPath() {
    if (posterPath.isEmpty) {
      return ApiUrl.errorImagePath;
    } else {
      return ApiUrl.imageBasePath + posterPath;
    }
  }

}
