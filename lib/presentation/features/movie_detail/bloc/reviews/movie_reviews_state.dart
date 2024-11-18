part of 'movie_reviews_bloc.dart';

@immutable
sealed class MovieReviewsState {}

final class MovieReviewsInitial extends MovieReviewsState {}

final class MovieReviewsLoading extends MovieReviewsState {}

final class MovieReviewsLoaded extends MovieReviewsState {
  final List<Review> reviews;

  MovieReviewsLoaded(this.reviews);
}

final class MovieReviewsError extends MovieReviewsState {
  final String message;

  MovieReviewsError(this.message);
}
