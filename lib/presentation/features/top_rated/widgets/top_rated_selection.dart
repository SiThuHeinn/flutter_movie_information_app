import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/top_rated_selection_cubit.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:movie_info/presentation/features/top_rated/widgets/select_option.dart';

import '../bloc/movies/top_rated_movies_bloc.dart';

class TopRatedSelection extends StatelessWidget {
  const TopRatedSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedSelectionCubit, TopRatedSelectionType>(
        builder: (ctx, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectOption(
                  title: 'Movies 📌',
                  isSelected: state == TopRatedSelectionType.movie,
                  onTap: () {
                    context.read<TopRatedSelectionCubit>().onSelectMovie();
                    context.read<TopRatedMoviesBloc>().add(GetTopRatedMoviesEvent(1));
                  }
              ),
              const SizedBox(width: 8),
              SelectOption(
                  title: 'TV Shows 📌',
                  isSelected: state == TopRatedSelectionType.tvShow,
                  onTap: () {
                    context.read<TopRatedSelectionCubit>().onSelectTvShow();
                    context.read<TopRatedTvShowsBloc>().add(GetTopRatedTvShowsEvent(1));

                  }
              ),
            ],
          );
        }
    );
  }
}
