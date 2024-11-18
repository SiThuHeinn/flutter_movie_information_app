part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class EmptySearchEvent extends SearchEvent {
  EmptySearchEvent();
}

final class SearchMovieEvent extends SearchEvent {

  SearchMovieEvent();
}

final class SearchTvShowEvent extends SearchEvent {

  SearchTvShowEvent();
}
