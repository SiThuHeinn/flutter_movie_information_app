import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/movie_detail/movie_details.dart';
import 'package:movie_info/presentation/features/tv_show_detail/tv_show_details.dart';
import 'package:movie_info/presentation/widgets/item_content_card.dart';

import '../bloc/search/search_bloc.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: Text('Search for movies or tv shows'));
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchMovieLoaded) {
            return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.push(context, MovieDetails(movie: movie));
                      },
                      child: ItemContentCard(movie: movie.toItemContent()),
                    ),
                  );
                },
            );
        } else if (state is SearchTvLoaded) {
          return ListView.builder(
            itemCount: state.tvs.length,
            itemBuilder: (context, index) {
              final tv = state.tvs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, TvShowDetails(id: tv.id));
                  },
                  child: ItemContentCard(movie: tv.toSearchContent()),
                ),
              );
            },
          );
        } else if (state is SearchError) {
          return Center(child: Text(state.message));
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}