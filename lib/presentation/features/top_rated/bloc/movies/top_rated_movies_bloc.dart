import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_top_rated_movies.dart';

import '../../../../../domain/entities/Movie.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {

  final GetTopRatedMovies getTopRatedMovies;

  final ScrollController scrollController = ScrollController();

  TopRatedMoviesBloc({required this.getTopRatedMovies}) : super(TopRatedMoviesState.init()) {

    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        debugPrint('on pagination: Page = ${state.page}');
        debugPrint('on pagination: Previous = ${state.movies.map((e) => e.title)}');
        debugPrint('on pagination: Size = ${state.movies.length}');
        add(GetTopRatedMoviesEvent(state.page + 1));
      }
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      emit(state.copyWith(state: TopRatedMoviesStatus.loading));
      if (state.page > state.totalPages) {
        emit(state.copyWith(state: TopRatedMoviesStatus.endOfList));
      } else {
        final result = await getTopRatedMovies(event.page);
        result.fold((failure) {
          emit(state.copyWith(state: TopRatedMoviesStatus.error, message: failure.message));
        }, (movieBundle) {
          final updatedMovies = [...state.movies, ...movieBundle.movies];
          emit(state.copyWith(
            state: TopRatedMoviesStatus.loaded,
            movies: updatedMovies,
            page: movieBundle.page,
            totalPages: movieBundle.totalPages,
          ));
        });
      }

    });
  }
}
