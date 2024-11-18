

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/configs/assets/app_images.dart';
import '../../core/configs/theme/app_colors.dart';

class ImageCard extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;
  const ImageCard({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.radius = 12
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        placeholder: const AssetImage(AppImages.placeholder),
        image: NetworkImage(url),
        width: width,
        height: height,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 200),
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              Icons.broken_image, // Placeholder icon
              size: 40,
              color: Colors.grey,
            ),
          );
        }
    );
  }
}
