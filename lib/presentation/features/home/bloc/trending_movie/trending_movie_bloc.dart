import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/entities/TvShow.dart';

import '../../../../../domain/entities/Movie.dart';
import '../../../../../domain/usecases/get_trending_movies.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMovieBloc({required this.getTrendingMovies}) : super(TrendingMovieInitial()) {
    on<GetTrendingMoviesEvent>((event, emit) async {
      emit(TrendingMovieLoading());

      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
        (failure) => emit(TrendingMovieError(failure.toString())),
        (movies) => emit(TrendingMovieLoaded(movies)));
    });
  }
}
