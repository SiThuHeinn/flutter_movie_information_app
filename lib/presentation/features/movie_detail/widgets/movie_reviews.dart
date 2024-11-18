

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/movie_detail/bloc/reviews/movie_reviews_bloc.dart';

import '../../../../di/injection_container.dart';

class MovieReviews extends StatelessWidget {
  final int movieId;
  const MovieReviews({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieReviewsBloc>()..add(GetMovieReviewsEvent(movieId)),
      child: BlocBuilder<MovieReviewsBloc, MovieReviewsState>(
          builder: (context, state) {
            if (state is MovieReviewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieReviewsLoaded) {
              if (state.reviews.isEmpty) {
                return const Center(child: Text("No reviews found", style: TextStyle(color: Colors.white, fontSize: 16)));
              } else {
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.reviews.length,
                    itemBuilder: (context, index) {
                      final review = state.reviews[index];
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListTile(
                          title: Text(
                              review.author,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          subtitle: Text(
                              review.content,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal
                              )
                          ),
                          onTap: () {

                          },
                        ),
                      );
                    },
                  ),
                );
              }
            } else if (state is MovieReviewsError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          }
      ),
    );
  }
}
