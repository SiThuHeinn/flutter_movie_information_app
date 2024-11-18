import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/domain/entities/People.dart';
import 'package:movie_info/presentation/features/people_detail/bloc/profile_images_bloc.dart';
import 'package:movie_info/presentation/features/people_detail/widgets/people_info_content.dart';
import 'package:movie_info/presentation/features/people_detail/widgets/profile_image_slider.dart';
import 'package:movie_info/presentation/widgets/image_card.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../di/injection_container.dart';
import 'bloc/people_details/people_details_bloc.dart';

class PeopleDetailsScreen extends StatelessWidget {
  final People people;

  const PeopleDetailsScreen({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: AppColors.secondBackground,
          backgroundColor: AppColors.background,
          title: const Text(
            "Information",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => getIt<ProfileImagesBloc>()
                    ..add(GetProfileImagesEvent(people.id))),
              BlocProvider(
                  create: (context) => getIt<PeopleDetailsBloc>()
                    ..add(GetPeopleDetailsEvent(people.id))),
            ],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileImageSlider(),
                  const SizedBox(height: 16),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PeopleInfoContent(),
                          const SizedBox(height: 16),
                          const Text("Known For",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                                itemCount: people.knownFor.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final knownFor = people.knownFor[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: ImageCard(
                                        url: knownFor.getFullPosterPath(),
                                        width: 100,
                                        height: 130,
                                        radius: 12,
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      )
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )));
  }
}
