



import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';

import '../entities/Movie.dart';
import '../repository/movie_repository.dart';

class GetRecommendedMovies {
  final MovieRepository movieRepository;

  GetRecommendedMovies(this.movieRepository);

  Future<Either<ServerFailure, List<Movie>>> call(int movieId) async {
    return await movieRepository.getRecommendations(movieId);
  }
}