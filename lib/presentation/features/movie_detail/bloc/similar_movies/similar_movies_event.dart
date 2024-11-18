part of 'similar_movies_bloc.dart';

@immutable
sealed class SimilarMoviesEvent {}

class GetSimilarMoviesEvent extends SimilarMoviesEvent {
  final int movieId;

  GetSimilarMoviesEvent(this.movieId);
}
