part of 'trending_movie_bloc.dart';

@immutable
sealed class TrendingMovieState {}

final class TrendingMovieInitial extends TrendingMovieState {}
final class TrendingMovieLoading extends TrendingMovieState {}
final class TrendingMovieLoaded extends TrendingMovieState {
  final List<Movie> movies;

  TrendingMovieLoaded(this.movies);
}
final class TrendingMovieError extends TrendingMovieState {
  final String message;

  TrendingMovieError(this.message);
}
