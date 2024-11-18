part of 'upcoming_movie_bloc.dart';

@immutable
sealed class UpcomingMovieEvent {}

final class GetUpComingMoviesEvent extends UpcomingMovieEvent {}

final class RefreshUpComingMoviesEvent extends UpcomingMovieEvent {}
