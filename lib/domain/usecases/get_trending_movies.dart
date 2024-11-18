
import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);


  Future<Either<ServerFailure, List<Movie>>> call() async {
    return await repository.getTrendingMovies();
}


}