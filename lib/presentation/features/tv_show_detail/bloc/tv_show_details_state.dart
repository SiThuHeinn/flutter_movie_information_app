part of 'tv_show_details_bloc.dart';

@immutable
sealed class TvShowDetailsState {}

final class TvShowDetailsInitial extends TvShowDetailsState {}

final class TvShowDetailsLoading extends TvShowDetailsState {}

final class TvShowDetailsLoaded extends TvShowDetailsState {
  final TvShowDetails tvShowDetails;

  TvShowDetailsLoaded(this.tvShowDetails);
}

final class TvShowDetailsError extends TvShowDetailsState {
  final String message;

  TvShowDetailsError(this.message);
}
