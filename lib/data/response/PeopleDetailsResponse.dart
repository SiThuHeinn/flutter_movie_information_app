

import 'package:intl/intl.dart';

import '../../domain/entities/PeopleDetails.dart';

class PeopleDetailsResponse {
  PeopleDetailsResponse({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  final bool? adult;
  final List<String> alsoKnownAs;
  final String? biography;
  final DateTime? birthday;
  final dynamic deathday;
  final int? gender;
  final dynamic homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;

  factory PeopleDetailsResponse.fromJson(Map<String, dynamic> json){
    return PeopleDetailsResponse(
      adult: json["adult"],
      alsoKnownAs: json["also_known_as"] == null ? [] : List<String>.from(json["also_known_as"]!.map((x) => x)),
      biography: json["biography"],
      birthday: DateTime.tryParse(json["birthday"] ?? ""),
      deathday: json["deathday"],
      gender: json["gender"],
      homepage: json["homepage"],
      id: json["id"],
      imdbId: json["imdb_id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      placeOfBirth: json["place_of_birth"],
      popularity: json["popularity"],
      profilePath: json["profile_path"],
    );
  }

  PeopleDetails toModel() {
    return PeopleDetails(
      adult: adult ?? false,
      alsoKnownAs: alsoKnownAs,
      biography: biography ?? "",
      birthday: DateFormat("dd MMM yyyy").format(birthday ?? DateTime.now()),
      deathday: deathday,
      isAlive: deathday == null,
      gender: gender ?? 0,
      homepage: homepage,
      id: id ?? 0,
      imdbId: imdbId ?? "",
      knownForDepartment: knownForDepartment ?? "",
      name: name ?? "",
      placeOfBirth: placeOfBirth ?? "",
      popularity: popularity ?? 0.0,
      profilePath: profilePath ?? "",
    );
  }
}
