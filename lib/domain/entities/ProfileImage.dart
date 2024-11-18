
import 'package:movie_info/core/constants/api_url.dart';

class ProfileImage {
  ProfileImage({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final int height;
  final dynamic iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;



  String getProfile() {
    if (filePath.isEmpty) {
      return ApiUrl.errorImagePath;
    } else  {
      return ApiUrl.profileBasePath + filePath;
    }

  }
  
}

