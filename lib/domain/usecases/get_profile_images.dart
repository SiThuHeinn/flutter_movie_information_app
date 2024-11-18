

import 'package:dartz/dartz.dart';
import 'package:movie_info/core/server_failure.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';

import '../entities/ProfileImage.dart';

class GetProfileImages {
  final MovieRepository repository;

  GetProfileImages(this.repository);

  Future<Either<ServerFailure, List<ProfileImage>>> call(int personId) async {
    return await repository.getProfileImages(personId);
  }
}