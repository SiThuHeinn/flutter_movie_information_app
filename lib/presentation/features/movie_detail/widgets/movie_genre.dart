

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../../di/injection_container.dart';
import '../bloc/genres/movie_genres_bloc.dart';

class MovieGenre extends StatelessWidget {

  final int movieId;

  const MovieGenre({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MovieGenresBloc>()..add(GetMovieGenresEvent(movieId)),
        child: BlocBuilder<MovieGenresBloc, MovieGenresState>(
            builder: (context, state) {
          if (state is MovieGenresLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieGenresLoaded) {
            return SizedBox(
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.genres.length,
                itemBuilder: (context, index) {
                  final genre = state.genres[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(genre.name)),
                  );
                },
              ),
            );
          } else if (state is MovieGenresError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
            },
        )
    );
  }
}
