import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_tv_show_details.dart';

import '../../../../domain/entities/TvShowDetails.dart';

part 'tv_show_details_event.dart';
part 'tv_show_details_state.dart';

class TvShowDetailsBloc extends Bloc<TvShowDetailsEvent, TvShowDetailsState> {

  final GetTvShowDetails getTvShowDetails;

  TvShowDetailsBloc({ required this.getTvShowDetails}) : super(TvShowDetailsInitial()) {

    on<GetTvShowDetailsEvent>((event, emit) async {
      emit(TvShowDetailsLoading());

      final failureOrTvShowDetails = await getTvShowDetails(event.id);
      failureOrTvShowDetails.fold(
        (failure) => emit(TvShowDetailsError(failure.message)),
        (tvShowDetails) => emit(TvShowDetailsLoaded(tvShowDetails))
      );
    });
  }
}
