part of 'trending_tv_shows_bloc.dart';

@immutable
sealed class TrendingTvShowsEvent {}

final class GetTrendingTvShowsEvent extends TrendingTvShowsEvent {

  GetTrendingTvShowsEvent();
}
