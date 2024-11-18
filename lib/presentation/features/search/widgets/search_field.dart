import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/search/bloc/search_option/search_option_cubit.dart';

import '../bloc/search/search_bloc.dart';


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchBloc>().searchController,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: 'Search movies or tv shows',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(
              color: Colors.blue,
              Icons.filter_list_sharp
          ),
          onPressed: () {

          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (context.read<SearchOptionCubit>().state == SearchOptionType.movie) {
            context.read<SearchBloc>().add(SearchMovieEvent());
          } else {
            context.read<SearchBloc>().add(SearchTvShowEvent());
          }
        } else {
          context.read<SearchBloc>().add(EmptySearchEvent());
        }

      },
    );
  }
}
