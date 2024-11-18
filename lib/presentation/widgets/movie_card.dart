
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/presentation/widgets/image_card.dart';

import '../../domain/entities/Movie.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return _movieCard(movie);
  }
}


Widget _movieCard(Movie movie) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            ImageCard(url: movie.fullPosterPath, width: 130, height: 200),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.star,  // Alternatively, use any star icon of your choice
                              color: Colors.yellow,
                              size: 14.0,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 4.0), // Adds spacing between icon and text
                          ),
                          TextSpan(
                            text: '${movie.roundedVoteAverage}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )

  );
}