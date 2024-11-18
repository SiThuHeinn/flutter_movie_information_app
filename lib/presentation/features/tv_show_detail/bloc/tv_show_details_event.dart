part of 'tv_show_details_bloc.dart';

@immutable
sealed class TvShowDetailsEvent {}

final class GetTvShowDetailsEvent extends TvShowDetailsEvent {
  final int id;

  GetTvShowDetailsEvent(this.id);
}
