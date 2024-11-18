
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';
import 'package:movie_info/domain/usecases/get_trending_movies.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])


void main() {
  late GetTrendingMovies getTrendingMovies;
  late MockMovieRepository mockMovieRepository;


  setUp(() => {
    mockMovieRepository = MockMovieRepository(),
    getTrendingMovies = GetTrendingMovies(mockMovieRepository),
  });


  final tvMovieList = [
    const Movie(id: 1, title: "Test Movie 1", overview: "Overview 1", posterPath: "/image1", backdropPath: "/backdrop1", voteAverage: 7.5, releaseDate: "2021-09-09"),
    const Movie(id: 2, title: "Test Movie 2", overview: "Overview 2", posterPath: "/image2", backdropPath: "/backdrop2", voteAverage: 8.5, releaseDate: "2021-09-09"),
    const Movie(id: 3, title: "Test Movie 3", overview: "Overview 3", posterPath: "/image3", backdropPath: "/backdrop3", voteAverage: 9.5, releaseDate: "2021-09-09"),
  ];

  test('should get trending movies from the repository', () async {
    when(
      mockMovieRepository.getTrendingMovies()
    ).thenAnswer((_) async => Right(tvMovieList));

    final result = await getTrendingMovies();

    expect(result, Right(tvMovieList));
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);


  });

}