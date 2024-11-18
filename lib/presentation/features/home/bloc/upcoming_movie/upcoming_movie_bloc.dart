import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_upcoming_movies.dart';
import 'package:movie_info/presentation/features/home/bloc/upcoming_movie/upcoming_movie_state.dart';


part 'upcoming_movie_event.dart';


class UpcomingMovieBloc extends Bloc<UpcomingMovieEvent, UpcomingMovieState> {
  final GetUpcomingMovies getUpComingMovies;

  UpcomingMovieBloc({required this.getUpComingMovies}) : super(UpcomingMovieInitialState()) {
    on<GetUpComingMoviesEvent>((event, emit) async {
      emit(UpcomingMovieLoading());
      final failureOrMovies = await getUpComingMovies();

      failureOrMovies.fold(
        (failure) => emit(UpcomingMovieError(failure.message)),
        (movies) => emit(UpcomingMovieLoaded(movies)),
      );
    });

  }
}
