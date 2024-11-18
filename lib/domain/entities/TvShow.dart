import '../../core/constants/api_url.dart';
import '../../presentation/ui_model/item_content_model.dart';


class TvShowBundle {
  TvShowBundle({
    required this.page,
    required this.tvShows,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<TvShow> tvShows;
  final int totalPages;
  final int totalResults;
}

class TvShow {
  TvShow({
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

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  double get roundedVoteAverage => (voteAverage * 10).roundToDouble() / 10;

  String getFullPosterPath() {
    if (posterPath.isEmpty) {
      return ApiUrl.errorImagePath;
    } else {
      return ApiUrl.imageBasePath + posterPath;
    }
  }

  String getFullBackdropPath() {
    if (backdropPath.isEmpty) {
      return ApiUrl.errorImagePath;
    } else {
      return ApiUrl.imageBasePath + backdropPath;
    }
  }

  ItemContentModel toSearchContent() {
    return ItemContentModel(
      id: id,
      title: name,
      overview: overview,
      posterPath: getFullPosterPath(),
      backdropPath: getFullBackdropPath(),
      voteAverage: voteAverage,
      releaseDate: firstAirDate,
    );
  }
}
