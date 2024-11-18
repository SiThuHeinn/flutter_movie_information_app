import 'package:dartz/dartz.dart';
import 'package:movie_info/data/datasources/movie_remote_data_source.dart';
import 'package:movie_info/data/response/MovieResponse.dart';
import 'package:movie_info/data/response/TvShowDetailsResponse.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/entities/TvShow.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

import '../../core/server_exception.dart';
import '../../core/server_failure.dart';
import '../../domain/entities/Genre.dart';
import '../../domain/entities/MovieTrailer.dart';
import '../../domain/entities/People.dart';
import '../../domain/entities/PeopleDetails.dart';
import '../../domain/entities/ProfileImage.dart';
import '../../domain/entities/Review.dart';
import '../../domain/entities/TvShowDetails.dart';
import '../response/GenreResponse.dart';
import '../response/MovieTrailerResponse.dart';
import '../response/PeopleDetailsResponse.dart';
import '../response/PeopleResponse.dart';
import '../response/ProfileImageResponse.dart';
import '../response/ReviewResponse.dart';
import '../response/TvShowResponse.dart';

class MovieRepositoryImpl implements MovieRepository {


  final MovieRemoteDateSource remoteDateSource;

  MovieRepositoryImpl({ required this.remoteDateSource});

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      List<MovieResponse> response = await remoteDateSource.getPopularMovies();
      List<Movie> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies() async {
    try {
      List<MovieResponse> response = await remoteDateSource.getTrendingMovies();
      List<Movie> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query) async {
    try {
      List<MovieResponse> response = await remoteDateSource.searchMovies(query);
      List<Movie> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<TvShow>>> searchTvShows(String query) async {
    try {
      List<TvShowResponse> response = await remoteDateSource.searchTvShows(query);
      List<TvShow> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getUpcomingMovies() async {
    try {
      List<MovieResponse> response = await remoteDateSource.getUpcomingMovies();
      List<Movie> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getRecommendations(int movieId) async {
    try {
      List<MovieResponse> response = await remoteDateSource.getRecommendations(movieId);
      List<Movie> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }


  @override
  Future<Either<ServerFailure, List<MovieTrailer>>> getMovieTrailers(int movieId) async {
    try {
      List<MovieTrailerResponse> response = await remoteDateSource.getMovieTrailers(movieId);
      List<MovieTrailer> trailers = response.map((e) => e.toModel()).toList();
      return Right(trailers);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }


  @override
  Future<Either<ServerFailure, List<Review>>> getMovieReviews(int movieId) async {
    try {
      List<ReviewResponse> response = await remoteDateSource.getMovieReviews(movieId);
      List<Review> reviews = response.map((e) => e.toModel()).toList();
      return Right(reviews);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<Genre>>> getMovieGenres(int movieId) async {
    try {
      List<GenreResponse> response = await remoteDateSource.geMovieGenres(movieId);
      List<Genre> genres = response.map((e) => e.toModel()).toList();
      return Right(genres);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, TvShowDetails>> getTvShowDetails(int tvId) async {
    try {
      TvShowDetailsResponse response = await remoteDateSource.getTvShowDetails(tvId);
      TvShowDetails tvShowDetails = response.toModel();
      return Right(tvShowDetails);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }


  @override
  Future<Either<ServerFailure, PeopleBundle>> getPopularPeople(int page) async {
    try {
      PeopleResponseBundle response = await remoteDateSource.getPopularPeople(page);
      PeopleBundle peopleBundle = response.toModel();
      return Right(peopleBundle);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<ProfileImage>>> getProfileImages(int peopleId) async {
    try {
      List<ProfileImageResponse> response = await remoteDateSource.getProfileImages(peopleId);
      List<ProfileImage> images = response.map((e) => e.toModel()).toList();
      return Right(images);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, PeopleDetails>> getPeopleDetails(int peopleId) async {
    try {
      PeopleDetailsResponse response = await remoteDateSource.getPeopleDetails(peopleId);
      PeopleDetails peopleDetails = response.toModel();
      return Right(peopleDetails);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<TvShow>>> getTrendingTvShows() async {
    try {
      List<TvShowResponse> response = await remoteDateSource.getTrendingTvShows();
      List<TvShow> tvShows = response.map((e) => e.toModel()).toList();
      return Right(tvShows);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, TvShowBundle>> getTopRatedTvShows(int page) async {
    try {
      TvShowResponseBundle response = await remoteDateSource.getTopRatedTvShows(page);
      TvShowBundle tvShowBundle = response.toModel();
      return Right(tvShowBundle);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, MovieBundle>> getTopRatedMovies(int page) async {
    try {
      MovieResponseBundle response = await remoteDateSource.getTopRatedMovies(page);
      MovieBundle movieBundle = response.toModel();
      return Right(movieBundle);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getSimilarMovies(int movieId) async {
    try {
      List<MovieResponse> response = await remoteDateSource.getSimilarMovies(movieId);
      List<Movie> movies = response.map((e) => e.toModel()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}