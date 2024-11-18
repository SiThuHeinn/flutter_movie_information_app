

import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';
import 'package:movie_info/domain/entities/TvShow.dart';

import '../entities/Movie.dart';
import '../repository/movie_repository.dart';

class GetTopRatedTvShows {
  final MovieRepository repository;

  GetTopRatedTvShows(this.repository);

  Future<Either<ServerFailure, TvShowBundle>> call(int page) async {
    return await repository.getTopRatedTvShows(page);
  }
}