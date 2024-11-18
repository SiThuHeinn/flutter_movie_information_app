import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/entities/MovieTrailer.dart';
import 'package:movie_info/domain/usecases/get_movie_trailers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'movie_trailer_event.dart';
part 'movie_trailer_state.dart';

class MovieTrailerBloc extends Bloc<MovieTrailerEvent, MovieTrailerState> {

  final GetMovieTrailers getMovieTrailers;

  MovieTrailerBloc({ required this.getMovieTrailers}) : super(MovieTrailerInitial()) {
    on<GetMovieTrailersEvent>((event, emit) async {
      emit(MovieTrailerLoading());
      await getMovieTrailers.execute(event.movieId).then((response) {
        response.fold(
          (failure) => emit(MovieTrailerError(failure.message)),
          (trailers) async {
            final controller = YoutubePlayerController(
              initialVideoId: trailers[0].key ?? '',
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            );
            emit(MovieTrailerLoaded(trailers, controller));
          }
        );
      });
    });
  }
}
