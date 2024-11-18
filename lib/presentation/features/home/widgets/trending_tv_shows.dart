

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/home/bloc/trending_tv_shows/trending_tv_shows_bloc.dart';
import 'package:movie_info/presentation/features/tv_show_detail/tv_show_details.dart';
import 'package:movie_info/presentation/widgets/tv_show_card.dart';

import '../../../../di/injection_container.dart';
import '../../../../navigation/app_navigation.dart';

class TrendingTvShows extends StatelessWidget {

  const TrendingTvShows({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<TrendingTvShowsBloc>()..add(GetTrendingTvShowsEvent()),
        child: BlocBuilder<TrendingTvShowsBloc, TrendingTvShowsState>(
          builder: (context, state) {
            if (state is TrendingTvShowsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TrendingTvShowsLoaded) {
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
                            "Trending Tv Shows 🔥",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle "Sell All" button tap
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
                      itemCount: state.tvShows.length,
                      itemBuilder: (context, index) {
                        final show = state.tvShows[index];
                        return GestureDetector(
                          onTap: () {
                            AppNavigator.push(context, TvShowDetails(id: show.id));
                          },
                          child: TvShowCard(tvShow: show),
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (state is TrendingTvShowsError) {
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
