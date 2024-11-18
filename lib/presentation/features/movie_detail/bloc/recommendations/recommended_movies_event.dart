part of 'recommended_movies_bloc.dart';

@immutable
sealed class RecommendedMoviesEvent {}

class GetRecommendedMoviesEvent extends RecommendedMoviesEvent {
  final int movieId;

  GetRecommendedMoviesEvent(this.movieId);
}
