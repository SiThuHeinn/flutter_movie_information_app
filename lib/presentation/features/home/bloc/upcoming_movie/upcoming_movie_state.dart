
import 'package:flutter/cupertino.dart';

import '../../../../../domain/entities/Movie.dart';

@immutable
sealed class UpcomingMovieState {}

final class UpcomingMovieInitialState extends UpcomingMovieState {}

final class UpcomingMovieLoading extends UpcomingMovieState {}

final class UpcomingMovieLoaded extends UpcomingMovieState {
  final List<Movie> movies;

  UpcomingMovieLoaded(this.movies);
}

final class UpcomingMovieError extends UpcomingMovieState {
  final String message;

  UpcomingMovieError(this.message);
}
