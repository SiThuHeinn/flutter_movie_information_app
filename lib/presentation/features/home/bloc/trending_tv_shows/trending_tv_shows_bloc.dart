import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_trending_tv_shows.dart';

import '../../../../../domain/entities/TvShow.dart';

part 'trending_tv_shows_event.dart';
part 'trending_tv_shows_state.dart';

class TrendingTvShowsBloc extends Bloc<TrendingTvShowsEvent, TrendingTvShowsState> {

  final GetTrendingTvShows getTrendingTvShows;

  TrendingTvShowsBloc({required this.getTrendingTvShows}) : super(TrendingTvShowsInitial()) {


    on<GetTrendingTvShowsEvent>((event, emit) async {
      emit(TrendingTvShowsLoading());
      final failureOrTrendingTvShows = await getTrendingTvShows();
      failureOrTrendingTvShows.fold(
        (failure) => emit(TrendingTvShowsError(message: failure.message)),
        (trendingTvShows) => emit(TrendingTvShowsLoaded(tvShows: trendingTvShows))
      );

    });
  }
}
