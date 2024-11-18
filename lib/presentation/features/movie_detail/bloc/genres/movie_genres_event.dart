part of 'movie_genres_bloc.dart';

@immutable
sealed class MovieGenresEvent {}

class GetMovieGenresEvent extends MovieGenresEvent {
  final int movieId;

  GetMovieGenresEvent(this.movieId);
}

