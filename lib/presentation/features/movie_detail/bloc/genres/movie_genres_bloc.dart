import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_movie_genres.dart';

import '../../../../../domain/entities/Genre.dart';

part 'movie_genres_event.dart';
part 'movie_genres_state.dart';

class MovieGenresBloc extends Bloc<MovieGenresEvent, MovieGenresState> {

  final GetMovieGenres getMovieGenres;

  MovieGenresBloc({required this.getMovieGenres}) : super(MovieGenresInitial()) {

    on<GetMovieGenresEvent>((event, emit) async {
      emit(MovieGenresLoading());
      final result = await getMovieGenres(event.movieId);
      result.fold(
        (failure) => emit(MovieGenresError(failure.message)),
        (genres) => emit(MovieGenresLoaded(genres)),
      );
    });
  }
}
