import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_similar_movies.dart';

import '../../../../../domain/entities/Movie.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {

  final GetSimilarMovies getSimilarMovies;

  SimilarMoviesBloc({required this.getSimilarMovies}) : super(SimilarMoviesInitial()) {

    on<GetSimilarMoviesEvent>((event, emit) async {
      emit(SimilarMoviesLoading());
      final result = await getSimilarMovies(event.movieId);
      result.fold(
        (failure) => emit(SimilarMoviesError(failure.message)),
        (movies) => emit(SimilarMoviesLoaded(movies))
      );
    });
  }
}
