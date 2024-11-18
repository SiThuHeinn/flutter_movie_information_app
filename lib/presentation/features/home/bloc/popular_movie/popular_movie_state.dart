part of 'popular_movie_bloc.dart';

@immutable
sealed class PopularMovieState {}

final class PopularMovieInitial extends PopularMovieState {}
final class PopularMovieLoading extends PopularMovieState {}
final class PopularMovieLoaded extends PopularMovieState {
  final List<Movie> movies;

  PopularMovieLoaded(this.movies);
}
final class PopularMovieError extends PopularMovieState {
  final String message;

  PopularMovieError(this.message);
}
