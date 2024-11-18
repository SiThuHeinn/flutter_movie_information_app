import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/tv_show_detail/bloc/tv_show_details_bloc.dart';
import 'package:movie_info/presentation/widgets/image_card.dart';
import 'package:movie_info/presentation/widgets/overview.dart';
import 'package:movie_info/presentation/widgets/title_label.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../di/injection_container.dart';
import '../../widgets/release_date_label.dart';
import '../../widgets/vote_average_label.dart';

class TvShowDetails extends StatefulWidget {
  final int id;

  const TvShowDetails({super.key, required this.id});

  @override
  State<TvShowDetails> createState() => _TvShowDetailsState();
}

class _TvShowDetailsState extends State<TvShowDetails> {
  int? _selectedSeason = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: AppColors.secondBackground,
        backgroundColor: AppColors.background,
        title: const Text(
          "TV Show Details",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
        getIt<TvShowDetailsBloc>()..add(GetTvShowDetailsEvent(widget.id)),
        child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
            builder: (context, state) {
              if (state is TvShowDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TvShowDetailsLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Stack(children: [
                              ImageCard(
                                  url: state.tvShowDetails.getFullBackdropPath(),
                                  width: double.infinity / 2,
                                  height: screenHeight / 2.5,
                                  radius: 24),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  height: 100,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.transparent, Colors.black],
                                      ),
                                    ),
                                  )),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TitleLabel(title: state.tvShowDetails.name),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReleaseDateLabel(
                                releaseDate: state.tvShowDetails.firstAirDate),
                            const SizedBox(width: 8),
                            const Text("⏐",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            VoteAverageLabel(
                                voteAverage: state.tvShowDetails.roundedVoteAverage),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.tvShowDetails.genres.length,
                            itemBuilder: (context, index) {
                              final genre = state.tvShowDetails.genres[index];
                              return Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.secondBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(child: Text(genre.name)),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        IntrinsicWidth(
                          child: DropdownButton<int>(
                            value: _selectedSeason,
                            items: List.generate(
                              state.tvShowDetails.numberOfSeasons,
                                  (index) => DropdownMenuItem(
                                value: index ,
                                child: Text("Season ${index + 1}", style: const TextStyle(color: Colors.blue, fontSize: 16)),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _selectedSeason = value;
                              });
                            },
                            dropdownColor: AppColors.secondBackground,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            isExpanded: true,
                          ),
                        ),
                        if (_selectedSeason != null) ...[
                          Text(
                            'Air Date: ${state.tvShowDetails.seasons[_selectedSeason!].airDate}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${state.tvShowDetails.seasons[_selectedSeason!].episodeCount} Episodes',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            state.tvShowDetails.seasons[_selectedSeason!+ 1].overview,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),

                        ],
                        const SizedBox(height: 16),
                        Overview(overview: state.tvShowDetails.overview),
                        const SizedBox(height: 16),

                      ],
                    ),
                  ),
                );
              } else if (state is TvShowDetailsError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
            }),
      ),
    );
  }
}