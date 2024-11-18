part of 'movie_trailer_bloc.dart';

@immutable
sealed class MovieTrailerState {}

final class MovieTrailerInitial extends MovieTrailerState {}

final class MovieTrailerLoading extends MovieTrailerState {}

final class MovieTrailerLoaded extends MovieTrailerState {
  final List<MovieTrailer> trailers;
  final YoutubePlayerController controller;

  MovieTrailerLoaded(this.trailers, this.controller);
}

final class MovieTrailerError extends MovieTrailerState {
  final String message;

  MovieTrailerError(this.message);
}
