part of 'popular_movie_bloc.dart';

@immutable
sealed class PopularMovieEvent {}

final class GetPopularMoviesEvent extends PopularMovieEvent {}
