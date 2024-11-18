import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/core/configs/theme/app_colors.dart';
import 'package:movie_info/presentation/ui_model/item_content_model.dart';
import 'package:movie_info/presentation/widgets/image_card.dart';
import 'package:movie_info/presentation/widgets/release_date_label.dart';
import 'package:movie_info/presentation/widgets/vote_average_label.dart';


class ItemContentCard extends StatelessWidget {
  final ItemContentModel movie;

  const ItemContentCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: ImageCard(
                url: movie.posterPath,
                width: 100,
                height: 130
            )
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie.overview,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReleaseDateLabel(releaseDate: movie.releaseDate, fontSize: 12),
                    const SizedBox(width: 8),
                    const Text("●", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    VoteAverageLabel(voteAverage: movie.voteAverage),
                  ],
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
