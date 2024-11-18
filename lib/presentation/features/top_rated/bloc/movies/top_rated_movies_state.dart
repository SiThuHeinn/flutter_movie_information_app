part of 'top_rated_movies_bloc.dart';

class TopRatedMoviesState {
  final TopRatedMoviesStatus status;
  final List<Movie> movies;
  final String message;
  final int page;
  int totalPages;

  TopRatedMoviesState( {
    this.page = 0,
    this.totalPages = 0,
    required this.status,
    required this.movies,
    required this.message
  });

  factory TopRatedMoviesState.init() {
    return TopRatedMoviesState(
      status: TopRatedMoviesStatus.init,
      movies: [],        // Start with an empty list of movies
      message: '',       // No error message initially
      page: 0,           // Start from the first page
      totalPages: 1,     // Set totalPages to a minimum of 1 to avoid premature stopping
    );
  }

  TopRatedMoviesState copyWith({
    TopRatedMoviesStatus? state,
    List<Movie>? movies,
    String? message,
    int? page,
    int? totalPages,
  }) {
    return TopRatedMoviesState(
      status: state ?? status,
      movies: movies ?? this.movies,
      message: message ?? this.message,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
    );
  }

}

enum TopRatedMoviesStatus {
  init,
  loading,
  loaded,
  endOfList,
  error
}