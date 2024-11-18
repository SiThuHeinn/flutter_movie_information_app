import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_info/core/constants/api_url.dart';
import 'package:movie_info/core/network/dio_client.dart';
import 'package:movie_info/core/server_exception.dart';
import 'package:movie_info/data/datasources/movie_remote_data_source.dart';
import 'package:movie_info/data/response/ReviewResponse.dart';

import '../response/GenreResponse.dart';
import '../response/MovieResponse.dart';
import '../response/MovieTrailerResponse.dart';
import '../response/PeopleDetailsResponse.dart';
import '../response/PeopleResponse.dart';
import '../response/ProfileImageResponse.dart';
import '../response/TvShowDetailsResponse.dart';
import '../response/TvShowResponse.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDateSource {
  final http.Client client;
  final DioClient dioClient;

  MovieRemoteDataSourceImpl({
    required this.client,
    required this.dioClient
  });

  static const String _baseUrl = "https://api.themoviedb.org/3";
  static const String _apiKey = "dc6f6d4cc6c09db8ca384d0d85b538cd";

  @override
  Future<List<MovieResponse>> getPopularMovies() async {

    final response = await dioClient.get(ApiUrl.popularMovies);

    if (response.statusCode == 200) {
      try {

        final List<MovieResponse> movies = List.from(response.data["results"])
            .map((movie) => MovieResponse.fromJson(movie))
            .toList();
        return movies;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(
          message: "Failed to load popular movies movies");
    }
  }

  @override
  Future<List<MovieResponse>> getTrendingMovies() async {
    final response = await dioClient.get(ApiUrl.trendingMovies);

    if (response.statusCode == 200) {
      try {
        final List<MovieResponse> movies = List.from(response.data["results"])
            .map((movie) => MovieResponse.fromJson(movie))
            .toList();
        return movies;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }

    } else {
      return throw ServerException(message: "Failed to load trending movies");
    }
  }



  @override
  Future<List<MovieResponse>> searchMovies(String query) async {
    final response = await dioClient.get(ApiUrl.searchMovies, queryParameters: {
      "query": query
    });

    if (response.statusCode == 200) {

      try {
        final List<MovieResponse> movies = List.from(response.data["results"])
            .map((movie) => MovieResponse.fromJson(movie))
            .toList();
        return movies;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to search movies");
    }
  }

  @override
  Future<List<TvShowResponse>> searchTvShows(String query) async {
    final response = await dioClient.get(ApiUrl.searchTvShows, queryParameters: {
      "query": query
    });

    if (response.statusCode == 200) {

      try {
        final List<TvShowResponse> tvShows = List.from(response.data["results"])
            .map((movie) => TvShowResponse.fromJson(movie))
            .toList();
        return tvShows;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to search tv shows");
    }
  }

  @override
  Future<List<MovieResponse>> getUpcomingMovies() async {
     final response = await dioClient.get(ApiUrl.upcomingMovies);

     if (response.statusCode == 200) {
        try {
          final List<MovieResponse> movies = List.from(response.data["results"])
              .map((movie) => MovieResponse.fromJson(movie))
              .toList();
          return movies;
        } catch (e) {
          log(e.toString());
          throw ServerException(message: e.toString());
        }
      } else {
        return throw ServerException(message: "Failed to load upcoming movies");
     }
  }

  @override
  Future<List<MovieResponse>> getRecommendations(int movieId) async {
    final response = await dioClient.get('${ApiUrl.recommendations}$movieId/recommendations');

    if (response.statusCode == 200) {
      try {
        final List<MovieResponse> movies = List.from(response.data["results"])
            .map((movie) => MovieResponse.fromJson(movie))
            .toList();
        return movies;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load recommendations");
    }
  }

  @override
  Future<List<MovieTrailerResponse>> getMovieTrailers(int movieId) async {
    final response = await dioClient.get("${ApiUrl.movieDetail}/$movieId/videos");

    if (response.statusCode == 200) {
      try {
        final List<MovieTrailerResponse> trailers = List.from(response.data["results"])
            .map((trailer) => MovieTrailerResponse.fromJson(trailer))
            .toList();
        return trailers;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load movie trailers");
    }
  }

  @override
  Future<List<ReviewResponse>> getMovieReviews(int movieId) async {
    final response = await dioClient.get("${ApiUrl.movieDetail}/$movieId/reviews");

    if (response.statusCode == 200) {
      try {
        final List<ReviewResponse> reviews = List.from(response.data["results"])
            .map((review) => ReviewResponse.fromJson(review))
            .toList();
        return reviews;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load movie reviews");
    }
  }

  @override
  Future<List<GenreResponse>> geMovieGenres(int movieId) async {
    final response = await dioClient.get("${ApiUrl.movieDetail}/$movieId");

    if (response.statusCode == 200) {
      try {
        final List<GenreResponse> genres = List.from(response.data["genres"])
            .map((genre) => GenreResponse.fromJson(genre))
            .toList();
        return genres;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load movie genres");
    }
  }

  @override
  Future<TvShowDetailsResponse> getTvShowDetails(int tvId) async {
    final response = await dioClient.get("${ApiUrl.tvShowDetail}/$tvId");

    if (response.statusCode == 200) {
      try {
        final TvShowDetailsResponse tvShow = TvShowDetailsResponse.fromJson(response.data);
        return tvShow;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load tv show details");
    }
  }


  @override
  Future<PeopleResponseBundle> getPopularPeople(int page) async {
    final response = await dioClient.get("${ApiUrl.popularPeople}?page=$page");

    if (response.statusCode == 200) {
      try {
        final PeopleResponseBundle people = PeopleResponseBundle.fromJson(response.data);
        return people;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load popular people");
    }
  }

  @override
  Future<List<ProfileImageResponse>> getProfileImages(int personId) async {
    final response = await dioClient.get("${ApiUrl.personDetail}/$personId/images");

    if (response.statusCode == 200) {
      try {
        final List<ProfileImageResponse> images = List.from(response.data["profiles"])
            .map((image) => ProfileImageResponse.fromJson(image))
            .toList();
        return images;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load profile images");
    }
  }

  @override
  Future<PeopleDetailsResponse> getPeopleDetails(int personId) async {
    final response = await dioClient.get("${ApiUrl.personDetail}/$personId");

    if (response.statusCode == 200) {
      try {
        final PeopleDetailsResponse people = PeopleDetailsResponse.fromJson(response.data);
        return people;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load people details");
    }
  }

  @override
  Future<List<TvShowResponse>> getTrendingTvShows() async {
    final response = await dioClient.get(ApiUrl.trendingTvShows);

    if (response.statusCode == 200) {
      try {
        final List<TvShowResponse> tvShows = List.from(response.data["results"])
            .map((tvShow) => TvShowResponse.fromJson(tvShow))
            .toList();
        return tvShows;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load trending tv shows");
    }
  }

  @override
  Future<MovieResponseBundle> getTopRatedMovies(int page) async {
    final response = await dioClient.get("${ApiUrl.topRatedMovies}?page=$page");

    if (response.statusCode == 200) {
      try {
        final MovieResponseBundle movies = MovieResponseBundle.fromJson(response.data);
        return movies;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load top rated movies");
    }
  }

  @override
  Future<TvShowResponseBundle> getTopRatedTvShows(int page) async {
    final response = await dioClient.get("${ApiUrl.topRatedTvShows}?page=$page");

    if (response.statusCode == 200) {
      try {
        final TvShowResponseBundle tvShows = TvShowResponseBundle.fromJson(response.data);
        return tvShows;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load top rated tv shows");
    }
  }


  @override
  Future<List<MovieResponse>> getSimilarMovies(int movieId) async {
    final response = await dioClient.get("${ApiUrl.movieDetail}/$movieId/similar");

    if (response.statusCode == 200) {
      try {
        final List<MovieResponse> movies = List.from(response.data["results"])
            .map((movie) => MovieResponse.fromJson(movie))
            .toList();
        return movies;
      } catch (e) {
        log(e.toString());
        throw ServerException(message: e.toString());
      }
    } else {
      return throw ServerException(message: "Failed to load similar movies");
    }
  }

}
