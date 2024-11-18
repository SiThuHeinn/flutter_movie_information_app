

import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/entities/Movie.dart';

import '../../core/server_failure.dart';
import '../repository/movie_repository.dart';

class GetUpcomingMovies {
  final MovieRepository repository;


  GetUpcomingMovies(this.repository);

  Future<Either<ServerFailure, List<Movie>>> call() async {
    return await repository.getUpcomingMovies();
  }

}