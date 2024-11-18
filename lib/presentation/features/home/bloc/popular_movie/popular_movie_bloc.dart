import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_popular_movies.dart';

import '../../../../../domain/entities/Movie.dart';


part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {

  final GetPopularMovies getPopularMovies;

  PopularMovieBloc({required this.getPopularMovies}) : super(PopularMovieInitial()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      emit(PopularMovieLoading());
      final failureOrMovies = await getPopularMovies();

      failureOrMovies.fold(
        (failure) => emit(PopularMovieError(failure.message))
      ,
      (movies) => emit(PopularMovieLoaded(movies)));
    });
  }


}
