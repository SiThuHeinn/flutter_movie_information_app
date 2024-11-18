

import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

import '../../core/server_failure.dart';

class SearchMovie {

  final MovieRepository repository;

  SearchMovie(this.repository);



  Future<Either<ServerFailure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }

}