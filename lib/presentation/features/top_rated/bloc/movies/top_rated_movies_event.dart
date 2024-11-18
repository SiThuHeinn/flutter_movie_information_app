part of 'top_rated_movies_bloc.dart';

@immutable
sealed class TopRatedMoviesEvent {}

class GetTopRatedMoviesEvent extends TopRatedMoviesEvent {
  final int page;
  GetTopRatedMoviesEvent(this.page);
}
