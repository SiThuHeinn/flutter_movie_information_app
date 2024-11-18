

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/di/injection_container.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../bloc/trailer/movie_trailer_bloc.dart';

class MovieTrailer extends StatelessWidget {
  final int movieId;
  const MovieTrailer({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MovieTrailerBloc>()..add(GetMovieTrailersEvent(movieId)),
        child: BlocBuilder<MovieTrailerBloc, MovieTrailerState>(
            builder: (context, state) {
              
              if (state is MovieTrailerLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is MovieTrailerError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is MovieTrailerLoaded) {
                return YoutubePlayer(
                    controller: state.controller,
                    showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.blue,
                    handleColor: Colors.grey,
                  ),
                );
              } else {
                return const Center(
                  child: Text("Movie Trailer"),
                );
              }
            },
        ),
    );
  }
}
