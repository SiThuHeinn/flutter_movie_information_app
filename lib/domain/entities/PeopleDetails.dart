
class PeopleDetails {
  PeopleDetails({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.isAlive,
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

  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final String birthday;
  final dynamic deathday;
  final bool isAlive;
  final int gender;
  final dynamic homepage;
  final int id;
  final String imdbId;
  final String knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;


  double get roundedPopularity => (popularity * 10).roundToDouble() / 10;

}
