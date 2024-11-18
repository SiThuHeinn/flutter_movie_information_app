import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/entities/MovieTrailer.dart';
import 'package:movie_info/domain/entities/People.dart';
import 'package:movie_info/domain/entities/PeopleDetails.dart';
import 'package:movie_info/domain/entities/ProfileImage.dart';
import 'package:movie_info/domain/entities/Review.dart';
import 'package:movie_info/domain/entities/TvShow.dart';
import 'package:movie_info/domain/entities/TvShowDetails.dart';

import '../entities/Genre.dart';

abstract class MovieRepository {


  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies();

  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query);

  Future<Either<ServerFailure, List<TvShow>>> searchTvShows(String query);

  Future<Either<ServerFailure, List<Movie>>> getPopularMovies();

  Future<Either<ServerFailure, List<Movie>>> getUpcomingMovies();

  Future<Either<ServerFailure, List<Movie>>> getRecommendations(int movieId);

  Future<Either<ServerFailure, List<MovieTrailer>>> getMovieTrailers(int movieId);

  Future<Either<ServerFailure, List<Review>>> getMovieReviews(int movieId);

  Future<Either<ServerFailure, List<Genre>>> getMovieGenres(int movieId);

  Future<Either<ServerFailure, TvShowDetails>> getTvShowDetails(int tvId);

  Future<Either<ServerFailure, PeopleBundle>> getPopularPeople(int page);

  Future<Either<ServerFailure, List<ProfileImage>>> getProfileImages(int peopleId);

  Future<Either<ServerFailure, PeopleDetails>> getPeopleDetails(int peopleId);

  Future<Either<ServerFailure, List<TvShow>>> getTrendingTvShows();

  Future<Either<ServerFailure, TvShowBundle>> getTopRatedTvShows(int page);

  Future<Either<ServerFailure, MovieBundle>> getTopRatedMovies(int page);

  Future<Either<ServerFailure, List<Movie>>> getSimilarMovies(int movieId);


}