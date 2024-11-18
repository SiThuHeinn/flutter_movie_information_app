import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/top_rated_selection_cubit.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:movie_info/presentation/features/top_rated/widgets/top_rated_moveis_content.dart';
import 'package:movie_info/presentation/features/top_rated/widgets/top_rated_selection.dart';
import 'package:movie_info/presentation/features/top_rated/widgets/top_rated_tv_shows_content.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../di/injection_container.dart';
import 'bloc/movies/top_rated_movies_bloc.dart';



class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({super.key});

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Center(
              child: Text('Top Rated', style: TextStyle(color: Colors.white, fontSize: 16))
          ),
          backgroundColor: AppColors.background,
        ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<TopRatedSelectionCubit>()),
            BlocProvider(create: (context) => getIt<TopRatedTvShowsBloc>()..add(GetTopRatedTvShowsEvent(1))),
            BlocProvider(create: (context) => getIt<TopRatedMoviesBloc>()..add(GetTopRatedMoviesEvent(1))),
          ],
          child: BlocBuilder<TopRatedSelectionCubit, TopRatedSelectionType>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const TopRatedSelection(),
                      const SizedBox(height: 16),
                      if (state == TopRatedSelectionType.movie)
                        const TopRatedMoviesContent()
                      else
                        const TopRatedTvShowsContent()
                    ],
                  ),
                );
              }
          )
      )
    );
  }


}
