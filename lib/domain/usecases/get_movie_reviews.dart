
import 'package:dartz/dartz.dart';

import '../../core/server_failure.dart';
import '../entities/Review.dart';
import '../repository/movie_repository.dart';



class GetMovieReviews {
  final MovieRepository repository;

  GetMovieReviews(this.repository);

  Future<Either<ServerFailure, List<Review>>> call(int movieId) async {
    return await repository.getMovieReviews(movieId);
  }
}