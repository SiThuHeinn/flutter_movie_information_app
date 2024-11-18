import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/core/configs/theme/app_colors.dart';
import 'package:movie_info/domain/entities/Movie.dart';
import 'package:movie_info/presentation/features/movie_detail/widgets/movie_genre.dart';
import 'package:movie_info/presentation/features/movie_detail/widgets/movie_trailer.dart';
import 'package:movie_info/presentation/features/movie_detail/widgets/recommended_movies.dart';
import 'package:movie_info/presentation/features/movie_detail/widgets/similar_movies.dart';
import 'package:movie_info/presentation/widgets/release_date_label.dart';
import 'package:movie_info/presentation/widgets/title_label.dart';
import 'package:movie_info/presentation/widgets/vote_average_label.dart';

import '../../widgets/overview.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: AppColors.secondBackground,
          backgroundColor: AppColors.background,
          title: const Text(
            "Movie Details",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieTrailer(movieId: movie.id),
              const SizedBox(height: 16),
              TitleLabel(title: movie.title),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReleaseDateLabel(releaseDate: movie.releaseDate),
                  const SizedBox(width: 8),
                  const Text("⏐", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  VoteAverageLabel(voteAverage: movie.roundedVoteAverage),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                  height: 40,
                  child: MovieGenre(movieId: movie.id)
              ),
              const SizedBox(height: 16),
              Overview(overview: movie.overview),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const Text("Recommended Movies", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(height: 200, child: RecommendedMovies(movieId: movie.id)),
              const SizedBox(height: 16),
              const Text("Similar Movies", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(height: 200, child: SimilarMovies(movieId: movie.id)),
              const SizedBox(height: 16),
            ],
          ),
        ));
  }
}
