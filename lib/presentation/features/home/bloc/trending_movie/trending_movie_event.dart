part of 'trending_movie_bloc.dart';

@immutable
sealed class TrendingMovieEvent {}

final class GetTrendingMoviesEvent extends TrendingMovieEvent {}
