
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/di/injection_container.dart';

import '../../../../navigation/app_navigation.dart';
import '../../../widgets/movie_card.dart';
import '../bloc/similar_movies/similar_movies_bloc.dart';
import '../movie_details.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({
    super.key,
    required this.movieId
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SimilarMoviesBloc>()..add(GetSimilarMoviesEvent(movieId)),
      child: BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
          builder: (context, state) {
            if (state is SimilarMoviesLoading) {
              debugPrint("SimilarMovies: $movieId");
              return const Center(child: CircularProgressIndicator());
            } else if (state is SimilarMoviesLoaded) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  debugPrint("SimilarMovies: ${state.movies[index].title}");
                  final movie = state.movies[index];
                  return GestureDetector(
                      onTap: () {
                        AppNavigator.push(context, MovieDetails(movie: movie));
                      },
                      child: MovieCard(movie: movie));
                },
              );
            } else if (state is SimilarMoviesError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
      ),
    );
  }
}
