

import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';
import 'package:movie_info/domain/entities/PeopleDetails.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';


class GetPeopleDetails {
  final MovieRepository repository;

  GetPeopleDetails(this.repository);

  Future<Either<ServerFailure, PeopleDetails>> call(int id) async {
    return await repository.getPeopleDetails(id);
  }
}