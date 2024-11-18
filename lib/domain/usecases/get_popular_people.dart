


import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/entities/People.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

import '../../core/server_failure.dart';

class GetPopularPeople {
  final MovieRepository repository;

  GetPopularPeople(this.repository);

  Future<Either<ServerFailure, PeopleBundle>> call(int page) async {
    return await repository.getPopularPeople(page);
  }
}