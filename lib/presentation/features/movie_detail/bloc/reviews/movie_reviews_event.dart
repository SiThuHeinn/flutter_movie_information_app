part of 'movie_reviews_bloc.dart';

@immutable
sealed class MovieReviewsEvent {}

class GetMovieReviewsEvent extends MovieReviewsEvent {
  final int movieId;

  GetMovieReviewsEvent(this.movieId);
}
