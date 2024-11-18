

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/people/widgets/film_star_card.dart';
import 'package:movie_info/presentation/features/people_detail/people_details_screen.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../di/injection_container.dart';
import 'bloc/popular_people_bloc.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({super.key});

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Center(
            child: Text('Film Stars', style: TextStyle(color: Colors.white, fontSize: 16))
        ),
        backgroundColor: AppColors.background,
      ),
      body: BlocProvider(
          create: (context) => getIt<PopularPeopleBloc>()..add(GetPopularPeopleEvent(page: 1)),
        child: BlocBuilder<PopularPeopleBloc, PopularPeopleState>(
            builder: (context, PopularPeopleState state) {
              return ListView.builder(
                controller: context.read<PopularPeopleBloc>().scrollController,
                itemCount: state.people.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.people.length) {
                    final people = state.people[index];
                    return FilmStarCard(
                        people: people,
                        onTap: (id) {
                          debugPrint('People ID: $id');
                          AppNavigator.push(context, PeopleDetailsScreen(people: people));
                        }
                    );
                  } else {
                    if (state.state == Status.loaded) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state.state == Status.error) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  }
                },
              );
            },
        ),
      ),
    );
  }
}
