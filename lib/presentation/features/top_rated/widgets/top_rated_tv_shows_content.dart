import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:movie_info/presentation/features/tv_show_detail/tv_show_details.dart';
import 'package:movie_info/presentation/widgets/item_content_card.dart';

class TopRatedTvShowsContent extends StatelessWidget {
  const TopRatedTvShowsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvShowsBloc, TopRatedTvShowsState>(
        builder: (context, state) {
      return Expanded(
          child: ListView.builder(
              controller: context.read<TopRatedTvShowsBloc>().scrollController,
              itemCount: state.tvShows.length + 1,
              itemBuilder: (context, index) {
                if (index < state.tvShows.length) {
                  final tvShow = state.tvShows[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                        onTap: () {
                          AppNavigator.push(context, TvShowDetails(id: tvShow.id));
                        },
                        child: ItemContentCard(movie: tvShow.toSearchContent())),
                  );
                } else {
                  if (state.status == TopRatedTvShowsStatus.loaded) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state.status == TopRatedTvShowsStatus.error) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(child: Text('Error while loading movies')),
                    );
                  }
                  return Container();
                }
              }));
    });
  }
}
