import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/entities/TvShow.dart';
import 'package:movie_info/domain/usecases/search_movie.dart';

import '../../../../../domain/entities/Movie.dart';
import '../../../../../domain/usecases/search_tv_shows.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovie getSearchMovies;
  final SearchTvShows getSearchTvShows;

  final ScrollController scrollController = ScrollController();

  TextEditingController searchController = TextEditingController();

  SearchBloc({
    required this.getSearchMovies,
    required this.getSearchTvShows,
  }) : super(SearchInitial()) {

    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {

      }
    });

    on<EmptySearchEvent>(
      (event, emit) => emit(SearchInitial()),
    );

    on<SearchMovieEvent>((event, emit) async {
      if (searchController.text.isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());
      final failureOrMovies = await getSearchMovies(searchController.text);
      failureOrMovies.fold(
            (failure) => emit(SearchError(failure.toString())),
            (movies) => emit(SearchMovieLoaded(movies)),
      );
    });


    on<SearchTvShowEvent>((event, emit) async {
      if (searchController.text.isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());
      final failureOrMovies = await getSearchTvShows(searchController.text);
      failureOrMovies.fold(
            (failure) => emit(SearchError(failure.toString())),
            (tvShows) => emit(SearchTvLoaded(tvShows)),
      );
    });


  }
}
