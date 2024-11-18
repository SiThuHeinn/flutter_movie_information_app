import 'package:equatable/equatable.dart';
import 'package:movie_info/core/constants/api_url.dart';
import 'package:movie_info/presentation/features/search/widgets/search_content.dart';
import 'package:movie_info/presentation/ui_model/item_content_model.dart';


class MovieBundle extends Equatable {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  const MovieBundle({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });


  String get fullPosterPath => ApiUrl.imageBasePath + posterPath;

  String get fullBackdropPath => ApiUrl.imageBasePath + backdropPath;

  double get roundedVoteAverage => (voteAverage * 10).roundToDouble() / 10;

  @override
  List<Object?> get props => [id, title, overview, posterPath];


  ItemContentModel toItemContent() {
    return ItemContentModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: getFullBackdropPath(),
      backdropPath: getFullBackdropPath(),
      voteAverage: roundedVoteAverage,
      releaseDate: releaseDate,
    );
  }

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
}
