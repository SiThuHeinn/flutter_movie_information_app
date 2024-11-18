import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/di/injection_container.dart';
import 'package:movie_info/presentation/features/search/widgets/search_content.dart';
import 'package:movie_info/presentation/features/search/widgets/search_field.dart';
import 'package:movie_info/presentation/features/search/widgets/search_option_selection.dart';

import '../../../core/configs/theme/app_colors.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/search_option/search_option_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Center(
            child: Text('Search', style: TextStyle(color: Colors.white, fontSize: 16))
        ),
        backgroundColor: AppColors.background,
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<SearchBloc>()),
            BlocProvider(create: (context) => getIt<SearchOptionCubit>())
          ],
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                SearchField(),
                SizedBox(height: 16),
                SearchOptionSelection(),
                SizedBox(height: 16),
                Expanded(child: SearchContent())
              ],
            ),
          )
      )
    );
  }


}
