
import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/entities/MovieTrailer.dart';

import '../../core/server_failure.dart';
import '../repository/movie_repository.dart';



class GetMovieTrailers {
  final MovieRepository repository;

  GetMovieTrailers(this.repository);

  Future<Either<ServerFailure, List<MovieTrailer>>> execute(int movieId) async {
    return await repository.getMovieTrailers(movieId);
  }
}