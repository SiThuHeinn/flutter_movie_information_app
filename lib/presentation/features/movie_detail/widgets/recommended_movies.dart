import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/di/injection_container.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/movie_detail/movie_details.dart';
import 'package:movie_info/presentation/widgets/movie_card.dart';

import '../bloc/recommendations/recommended_movies_bloc.dart';

class RecommendedMovies extends StatelessWidget {
  final int movieId;

  const RecommendedMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecommendedMoviesBloc>()..add(GetRecommendedMoviesEvent(movieId)),
      child: BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
        builder: (context, state) {
          if (state is RecommendedMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecommendedMoviesLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                    onTap: () {
                      AppNavigator.push(context, MovieDetails(movie: movie));
                    },
                    child: MovieCard(movie: movie));
              },
            );
          } else if (state is RecommendedMoviesError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
