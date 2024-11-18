import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/Review.dart';
import '../../../../../domain/usecases/get_movie_reviews.dart';

part 'movie_reviews_event.dart';
part 'movie_reviews_state.dart';

class MovieReviewsBloc extends Bloc<MovieReviewsEvent, MovieReviewsState> {

  final GetMovieReviews getMovieReviews;

  MovieReviewsBloc({required this.getMovieReviews}) : super(MovieReviewsInitial()) {

    on<GetMovieReviewsEvent>((event, emit) async {
      emit(MovieReviewsLoading());
      final result = await getMovieReviews(event.movieId);
      result.fold(
        (failure) => emit(MovieReviewsError(failure.message)),
        (reviews) => emit(MovieReviewsLoaded(reviews)),
      );
    });
  }
}
