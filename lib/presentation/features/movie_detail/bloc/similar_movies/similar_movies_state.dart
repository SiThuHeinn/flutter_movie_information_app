part of 'similar_movies_bloc.dart';

@immutable
sealed class SimilarMoviesState {}

final class SimilarMoviesInitial extends SimilarMoviesState {}

final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<Movie> movies;

  SimilarMoviesLoaded(this.movies);
}

final class SimilarMoviesError extends SimilarMoviesState {
  final String message;

  SimilarMoviesError(this.message);
}

