import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_info/core/server_exception.dart';
import 'package:movie_info/core/server_failure.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/usecases/get_popular_movies.dart';

import 'get_trending_movies_test.mocks.dart';




void main() {

  late GetPopularMovies getPopularMovies;
  late MockMovieRepository mockMovieRepository;


  setUp(() => {
    mockMovieRepository = MockMovieRepository(),
    getPopularMovies = GetPopularMovies(mockMovieRepository)
  });


  final pMoviesList = [
    const Movie(id: 1, title: "Test Movie 1", overview: "Overview 1", posterPath: "/image1", backdropPath: "/backdrop1", voteAverage: 7.5, releaseDate: "2021-09-09"),
    const Movie(id: 2, title: "Test Movie 2", overview: "Overview 2", posterPath: "/image2", backdropPath: "/backdrop2", voteAverage: 8.5, releaseDate: "2021-09-09"),
    const Movie(id: 3, title: "Test Movie 3", overview: "Overview 3", posterPath: "/image3", backdropPath: "/backdrop3", voteAverage: 9.5, releaseDate: "2021-09-09"),
  ];
  test('should return popular movies from the repository', () async {

    when(
      mockMovieRepository.getPopularMovies()
    ).thenAnswer((_) async => Right(pMoviesList));

    final result = await getPopularMovies();

    expect(result, Right(pMoviesList));
    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);

  });


}