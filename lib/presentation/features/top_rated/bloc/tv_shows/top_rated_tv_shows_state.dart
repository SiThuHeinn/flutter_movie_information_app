part of 'top_rated_tv_shows_bloc.dart';

class TopRatedTvShowsState {
  final TopRatedTvShowsStatus status;
  final List<TvShow> tvShows;
  final String message;
  final int page;
  int totalPages;

  TopRatedTvShowsState( {
    this.page = 0,
    this.totalPages = 0,
    required this.status,
    required this.tvShows,
    required this.message
  });

  factory TopRatedTvShowsState.init() {
    return TopRatedTvShowsState(
      status: TopRatedTvShowsStatus.init,
      tvShows: [],        // Start with an empty list of tvShows
      message: '',       // No error message initially
      page: 0,           // Start from the first page
      totalPages: 1,     // Set totalPages to a minimum of 1 to avoid premature stopping
    );
  }

  TopRatedTvShowsState copyWith({
    TopRatedTvShowsStatus? state,
    List<TvShow>? tvShows,
    String? message,
    int? page,
    int? totalPages,
  }) {
    return TopRatedTvShowsState(
      status: state ?? status,
      tvShows: tvShows ?? this.tvShows,
      message: message ?? this.message,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
    );
  }

}

enum TopRatedTvShowsStatus {
  init,
  loading,
  loaded,
  endOfList,
  error
}