import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/people_detail/bloc/people_details/people_details_bloc.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../widgets/vote_average_label.dart';

class PeopleInfoContent extends StatefulWidget {
  const PeopleInfoContent({super.key});

  @override
  State<PeopleInfoContent> createState() => _PeopleInfoContentState();
}

class _PeopleInfoContentState extends State<PeopleInfoContent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleDetailsBloc, PeopleDetailsState>(
        builder: (context, state) {
          if (state is PeopleDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PeopleDetailsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      state.details.name,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    if (!state.details.isAlive)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const IntrinsicWidth(child: Center(child: Text('RIP'))),
                      ),

                  ],
                ),
                const SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IntrinsicWidth(child: Center(child: Text(state.details.knownForDepartment))),
                      ),
                      VoteAverageLabel(voteAverage: state.details.roundedPopularity),

                    ]
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (state.details.birthday.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IntrinsicWidth(child: Center(child: Text(state.details.birthday))),
                          ),

                        if (state.details.placeOfBirth.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IntrinsicWidth(child: Center(child: Text(state.details.placeOfBirth))),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Biography",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      state.details.biography,
                      style: const TextStyle(fontSize: 14),
                      maxLines: _isExpanded ? null : 3,
                      overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 16),



              ],
            );
          } else if (state is PeopleDetailsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }
          return Container();
        });
  }
}
