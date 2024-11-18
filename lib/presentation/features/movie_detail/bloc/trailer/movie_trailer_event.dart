part of 'movie_trailer_bloc.dart';

@immutable
sealed class MovieTrailerEvent {}


final class GetMovieTrailersEvent extends MovieTrailerEvent {
  final int movieId;

  GetMovieTrailersEvent(this.movieId);
}
