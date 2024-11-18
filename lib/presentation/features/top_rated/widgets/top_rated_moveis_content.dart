
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/movie_detail/movie_details.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/movies/top_rated_movies_bloc.dart';
import 'package:movie_info/presentation/widgets/item_content_card.dart';

class TopRatedMoviesContent extends StatelessWidget {
  const TopRatedMoviesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
        builder: (context, state) {
          return Expanded(
              child: ListView.builder(
                  controller: context.read<TopRatedMoviesBloc>().scrollController,
                  itemCount: state.movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.movies.length) {
                      final movie = state.movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              AppNavigator.push(context, MovieDetails(movie: movie));
                            },
                            child: ItemContentCard(movie: movie.toItemContent())
                        ),
                      );
                    } else {
                      if (state.status == TopRatedMoviesStatus.loaded) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state.status == TopRatedMoviesStatus.error) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(child: Text('Error while loading movies')),
                        );
                      }
                      return Container();
                    }
                  })
          );
        }
    );
  }
}
