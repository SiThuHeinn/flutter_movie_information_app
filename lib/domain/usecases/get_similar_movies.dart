

import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';

import '../entities/Movie.dart';
import '../repository/movie_repository.dart';

class GetSimilarMovies {
  final MovieRepository repository;

  GetSimilarMovies(this.repository);

  Future<Either<ServerFailure, List<Movie>>> call(int movieId) async {
    return await repository.getSimilarMovies(movieId);
  }
}