import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/search/widgets/search_option.dart';

import '../bloc/search/search_bloc.dart';
import '../bloc/search_option/search_option_cubit.dart';



class SearchOptionSelection extends StatelessWidget {
  const SearchOptionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchOptionCubit, SearchOptionType>(
        builder: (ctx, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchOption(
                  title: 'Movies',
                  isSelected: state == SearchOptionType.movie,
                  onTap: () {
                    context.read<SearchOptionCubit>().onSelectMovie();
                    context.read<SearchBloc>().add(SearchMovieEvent());
                  }
              ),
              const SizedBox(width: 8),
              SearchOption(
                  title: 'TV Shows',
                  isSelected: state == SearchOptionType.tvShow,
                  onTap: () {
                    context.read<SearchOptionCubit>().onSelectTvShow();
                    context.read<SearchBloc>().add(SearchTvShowEvent());
                  }
              ),
            ],
          );
        }
    );
  }
}
