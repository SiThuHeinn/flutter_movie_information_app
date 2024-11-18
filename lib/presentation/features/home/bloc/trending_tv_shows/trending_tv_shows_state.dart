part of 'trending_tv_shows_bloc.dart';

@immutable
sealed class TrendingTvShowsState {}

final class TrendingTvShowsInitial extends TrendingTvShowsState {}

final class TrendingTvShowsLoading extends TrendingTvShowsState {}

final class TrendingTvShowsLoaded extends TrendingTvShowsState {
  final List<TvShow> tvShows;

  TrendingTvShowsLoaded({required this.tvShows});
}

final class TrendingTvShowsError extends TrendingTvShowsState {
  final String message;

  TrendingTvShowsError({required this.message});
}

