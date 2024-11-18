import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/home/bloc/trending_movie/trending_movie_bloc.dart';
import 'package:movie_info/presentation/features/movie_detail/movie_details.dart';
import 'package:movie_info/presentation/widgets/movie_card.dart';

import '../../../../di/injection_container.dart';



class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<TrendingMovieBloc>()..add(GetTrendingMoviesEvent()),
        child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
          builder: (context, state) {
            if (state is TrendingMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TrendingMovieLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            "Trending Movies 🔥",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: const Text(
                            "Sell All",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return GestureDetector(
                          onTap: () {
                            AppNavigator.push(context, MovieDetails(movie: movie));
                          },
                          child: MovieCard(movie: movie),
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (state is TrendingMovieError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Centers vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Centers horizontally
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        )
    );
  }
}


