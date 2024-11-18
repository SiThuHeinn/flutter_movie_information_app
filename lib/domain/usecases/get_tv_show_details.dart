

import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/entities/TvShowDetails.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

import '../../core/server_failure.dart';

class GetTvShowDetails {
  final MovieRepository repository;

  GetTvShowDetails(this.repository);

  Future<Either<ServerFailure, TvShowDetails>> call(int id) async {
    return await repository.getTvShowDetails(id);
  }
}