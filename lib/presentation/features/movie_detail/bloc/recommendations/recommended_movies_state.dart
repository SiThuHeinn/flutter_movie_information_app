part of 'recommended_movies_bloc.dart';

@immutable
sealed class RecommendedMoviesState {}

final class RecommendedMoviesInitial extends RecommendedMoviesState {}

final class RecommendedMoviesLoading extends RecommendedMoviesState {}

final class RecommendedMoviesLoaded extends RecommendedMoviesState {
  final List<Movie> movies;

  RecommendedMoviesLoaded(this.movies);
}

final class RecommendedMoviesError extends RecommendedMoviesState {
  final String message;

  RecommendedMoviesError(this.message);
}
