import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_recommended_movies.dart';

import '../../../../../domain/entities/Movie.dart';

part 'recommended_movies_event.dart';
part 'recommended_movies_state.dart';

class RecommendedMoviesBloc extends Bloc<RecommendedMoviesEvent, RecommendedMoviesState> {
  final GetRecommendedMovies getRecommendedMovies;


  RecommendedMoviesBloc({required this.getRecommendedMovies}) : super(RecommendedMoviesInitial()) {
    on<GetRecommendedMoviesEvent>((event, emit) async {
      emit(RecommendedMoviesLoading());
       await getRecommendedMovies.call(event.movieId).then((response) {
        response.fold(
          (failure) => emit(RecommendedMoviesError(failure.message)),
          (movies) => emit(RecommendedMoviesLoaded(movies)),
        );
      });
    });
  }
}
