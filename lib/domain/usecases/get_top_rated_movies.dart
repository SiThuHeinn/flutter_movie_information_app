

import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';

import '../entities/Movie.dart';
import '../repository/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<ServerFailure, MovieBundle>> call(int page) async {
    return await repository.getTopRatedMovies(page);
  }
}