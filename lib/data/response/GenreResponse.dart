
import 'package:movie_info/domain/entities/Genre.dart';

class GenreResponse {
  GenreResponse({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory GenreResponse.fromJson(Map<String, dynamic> json){
    return GenreResponse(
      id: json["id"],
      name: json["name"],
    );
  }


  Genre toModel() {
    return Genre(
      id: id ?? 0,
      name: name ?? "",
    );
  }

}
