import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_top_rated_tv_shows.dart';

import '../../../../../domain/entities/TvShow.dart';

part 'top_rated_tv_shows_event.dart';
part 'top_rated_tv_shows_state.dart';

class TopRatedTvShowsBloc extends Bloc<TopRatedTvShowsEvent, TopRatedTvShowsState> {

  final GetTopRatedTvShows getTopRatedTvShows;

  final ScrollController scrollController = ScrollController();

  TopRatedTvShowsBloc({required this.getTopRatedTvShows}) : super(TopRatedTvShowsState.init()) {

    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        debugPrint('on pagination: Page = ${state.page}');
        debugPrint('on pagination: Previous = ${state.tvShows.map((e) => e.name)}');
        debugPrint('on pagination: Size = ${state.tvShows.length}');
        add(GetTopRatedTvShowsEvent(state.page + 1));
      }
    });

    on<GetTopRatedTvShowsEvent>((event, emit) async {
      emit(state.copyWith(state: TopRatedTvShowsStatus.loading));
      if (state.page > state.totalPages) {
        emit(state.copyWith(state: TopRatedTvShowsStatus.endOfList));
      } else {
        final result = await getTopRatedTvShows(event.page);
        result.fold((failure) {
          emit(state.copyWith(state: TopRatedTvShowsStatus.error, message: failure.message));
        }, (tvShowBundle) {
          final updatedTvShows = [...state.tvShows, ...tvShowBundle.tvShows];
          emit(state.copyWith(
            state: TopRatedTvShowsStatus.loaded,
            tvShows: updatedTvShows,
            page: tvShowBundle.page,
            totalPages: tvShowBundle.totalPages,
          ));
        });
      }
    });
  }
}
