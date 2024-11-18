

import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

import '../../core/server_failure.dart';
import '../entities/TvShow.dart';

class GetTrendingTvShows {
  final MovieRepository repository;

  GetTrendingTvShows(this.repository);

  Future<Either<ServerFailure, List<TvShow>>> call() async {
    return await repository.getTrendingTvShows();
  }
}