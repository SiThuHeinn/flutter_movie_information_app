

import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';

import '../entities/Genre.dart';
import '../repository/movie_repository.dart';

class GetMovieGenres {
  final MovieRepository repository;

  GetMovieGenres(this.repository);

  Future<Either<ServerFailure, List<Genre>>> call(int movieId) async {
    return await repository.getMovieGenres(movieId);
  }
}