part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchMovieLoaded extends SearchState {
  final List<Movie> movies;

  SearchMovieLoaded(this.movies);
}

final class SearchTvLoaded extends SearchState {
  final List<TvShow> tvs;

  SearchTvLoaded(this.tvs);
}

final class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}