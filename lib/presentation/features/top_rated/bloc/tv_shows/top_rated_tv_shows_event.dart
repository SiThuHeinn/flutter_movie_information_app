part of 'top_rated_tv_shows_bloc.dart';

@immutable
sealed class TopRatedTvShowsEvent {}

class GetTopRatedTvShowsEvent extends TopRatedTvShowsEvent {
  final int page;
  GetTopRatedTvShowsEvent(this.page);
}
