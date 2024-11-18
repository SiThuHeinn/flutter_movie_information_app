import 'package:carousel_slider/carousel_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/di/injection_container.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/movie_detail/movie_details.dart';
import 'package:movie_info/presentation/features/movie_detail/widgets/movie_trailer.dart';
import 'package:movie_info/presentation/widgets/image_card.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/popular_movie/popular_movie_bloc.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<PopularMovieBloc>()
        ..add(GetPopularMoviesEvent()),
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularMovieLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  CarouselSlider(
                      items: createImageSliders(state.movies, context),
                      options: CarouselOptions(
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2
                      )
                  ),
                ],
              );
            } else if (state is PopularMovieError) {
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
          }),
    );
  }
}


List<Widget> createImageSliders(List<Movie> movies, BuildContext context) {
  return movies.map((movie) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          AppNavigator.push(context, MovieDetails(movie: movie));
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Stack(
            children: <Widget>[
              ImageCard(
                  url: movie.fullBackdropPath,
                  width: double.infinity,
                  height: double.infinity
              ),
              Positioned(
                bottom: 0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.black,
                        ],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.star,  // Alternatively, use any star icon of your choice
                                      color: Colors.yellow,
                                      size: 16.0,
                                    ),
                                  ),
                                  const WidgetSpan(
                                    child: SizedBox(width: 4.0), // Adds spacing between icon and text
                                  ),
                                  TextSpan(
                                    text: '${movie.roundedVoteAverage}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )

                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }).toList();
}