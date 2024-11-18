


import 'package:movie_info/data/response/GenreResponse.dart';
import 'package:movie_info/data/response/MovieResponse.dart';
import 'package:movie_info/data/response/MovieTrailerResponse.dart';
import 'package:movie_info/data/response/PeopleDetailsResponse.dart';
import 'package:movie_info/data/response/PeopleResponse.dart';
import 'package:movie_info/data/response/ProfileImageResponse.dart';
import 'package:movie_info/data/response/ReviewResponse.dart';
import 'package:movie_info/data/response/TvShowDetailsResponse.dart';
import 'package:movie_info/data/response/TvShowResponse.dart';

abstract class MovieRemoteDateSource {

  Future<List<MovieResponse>> getTrendingMovies();

  Future<List<MovieResponse>> searchMovies(String query);

  Future<List<MovieResponse>> getPopularMovies();

  Future<List<MovieResponse>> getUpcomingMovies();

  Future<List<MovieResponse>> getRecommendations(int movieId);

  Future<List<MovieTrailerResponse>> getMovieTrailers(int movieId);

  Future<List<ReviewResponse>> getMovieReviews(int movieId);

  Future<List<GenreResponse>> geMovieGenres(int movieId);

  Future<MovieResponseBundle> getTopRatedMovies(int page);

  Future<List<MovieResponse>> getSimilarMovies(int movieId);



  // TV Shows
  Future<List<TvShowResponse>> searchTvShows(String query);

  Future<TvShowDetailsResponse> getTvShowDetails(int tvId);

  Future<List<TvShowResponse>> getTrendingTvShows();

  Future<TvShowResponseBundle> getTopRatedTvShows(int page);

  // People
  Future<PeopleResponseBundle> getPopularPeople(int page);

  Future<List<ProfileImageResponse>> getProfileImages(int personId);

  Future<PeopleDetailsResponse> getPeopleDetails(int personId);

}