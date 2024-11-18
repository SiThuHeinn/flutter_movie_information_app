
import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/entities/TvShow.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';


import '../../core/server_failure.dart';

class SearchTvShows {
  final MovieRepository repository;

  SearchTvShows(this.repository);

  Future<Either<ServerFailure, List<TvShow>>> call(String query) async {
    return await repository.searchTvShows(query);
  }
}