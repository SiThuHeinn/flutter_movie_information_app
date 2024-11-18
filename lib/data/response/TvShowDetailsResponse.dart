


import 'package:intl/intl.dart';
import 'package:movie_info/domain/entities/TvShowDetails.dart';

class TvShowDetailsResponse {
  TvShowDetailsResponse({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<CreatedByResponse> createdBy;
  final List<dynamic> episodeRunTime;
  final DateTime? firstAirDate;
  final List<TvGenreResponse> genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final LastEpisodeToAirResponse? lastEpisodeToAir;
  final String? name;
  final dynamic nextEpisodeToAir;
  final List<NetworkResponse> networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<NetworkResponse> productionCompanies;
  final List<ProductionCountryResponse> productionCountries;
  final List<SeasonResponse> seasons;
  final List<SpokenLanguageResponse> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;

  factory TvShowDetailsResponse.fromJson(Map<String, dynamic> json){
    return TvShowDetailsResponse(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      createdBy: json["created_by"] == null ? [] : List<CreatedByResponse>.from(json["created_by"]!.map((x) => CreatedByResponse.fromJson(x))),
      episodeRunTime: json["episode_run_time"] == null ? [] : List<dynamic>.from(json["episode_run_time"]!.map((x) => x)),
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      genres: json["genres"] == null ? [] : List<TvGenreResponse>.from(json["genres"]!.map((x) => TvGenreResponse.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      inProduction: json["in_production"],
      languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
      lastAirDate: DateTime.tryParse(json["last_air_date"] ?? ""),
      lastEpisodeToAir: json["last_episode_to_air"] == null ? null : LastEpisodeToAirResponse.fromJson(json["last_episode_to_air"]),
      name: json["name"],
      nextEpisodeToAir: json["next_episode_to_air"],
      networks: json["networks"] == null ? [] : List<NetworkResponse>.from(json["networks"]!.map((x) => NetworkResponse.fromJson(x))),
      numberOfEpisodes: json["number_of_episodes"],
      numberOfSeasons: json["number_of_seasons"],
      originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      productionCompanies: json["production_companies"] == null ? [] : List<NetworkResponse>.from(json["production_companies"]!.map((x) => NetworkResponse.fromJson(x))),
      productionCountries: json["production_countries"] == null ? [] : List<ProductionCountryResponse>.from(json["production_countries"]!.map((x) => ProductionCountryResponse.fromJson(x))),
      seasons: json["seasons"] == null ? [] : List<SeasonResponse>.from(json["seasons"]!.map((x) => SeasonResponse.fromJson(x))),
      spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguageResponse>.from(json["spoken_languages"]!.map((x) => SpokenLanguageResponse.fromJson(x))),
      status: json["status"],
      tagline: json["tagline"],
      type: json["type"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }


  TvShowDetails toModel() {
    return TvShowDetails(
      adult: adult ?? false,
      backdropPath: backdropPath ?? "",
      createdBy: createdBy.map((e) => e.toModel()).toList(),
      episodeRunTime: episodeRunTime,
      firstAirDate: DateFormat("dd MMM yyyy").format(firstAirDate ?? DateTime.now()),
      genres: genres.map((e) => e.toModel()).toList(),
      homepage: homepage ?? "",
      id: id ?? 0,
      inProduction: inProduction ?? false,
      languages: languages,
      lastAirDate: DateFormat("dd MMM yyyy").format(lastAirDate ?? DateTime.now()),
      lastEpisodeToAir: lastEpisodeToAir?.toModel() ?? LastEpisodeToAir.empty,
      name: name ?? "",
      nextEpisodeToAir: nextEpisodeToAir,
      networks: networks.map((e) => e.toModel()).toList(),
      numberOfEpisodes: numberOfEpisodes ?? 0,
      numberOfSeasons: numberOfSeasons ?? 0,
      originCountry: originCountry,
      originalLanguage: originalLanguage ?? "",
      originalName: originalName ?? "",
      overview: overview ?? "",
      popularity: popularity ?? 0.0,
      posterPath: posterPath ?? "",
      productionCompanies: productionCompanies.map((e) => e.toModel()).toList(),
      productionCountries: productionCountries.map((e) => e.toModel()).toList(),
      seasons: seasons.map((e) => e.toModel()).toList(),
      spokenLanguages: spokenLanguages.map((e) => e.toModel()).toList(),
      status: status ?? "",
      tagline: tagline ?? "",
      type: type ?? "",
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }

}

class CreatedByResponse {
  CreatedByResponse({
    required this.id,
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    required this.profilePath,
  });

  final int? id;
  final String? creditId;
  final String? name;
  final String? originalName;
  final int? gender;
  final String? profilePath;

  factory CreatedByResponse.fromJson(Map<String, dynamic> json){
    return CreatedByResponse(
      id: json["id"],
      creditId: json["credit_id"],
      name: json["name"],
      originalName: json["original_name"],
      gender: json["gender"],
      profilePath: json["profile_path"],
    );
  }

  CreatedBy toModel() {
    return CreatedBy(
      id: id ?? 0,
      creditId: creditId ?? "",
      name: name ?? "",
      originalName: originalName ?? "",
      gender: gender ?? 0,
      profilePath: profilePath ?? "",
    );
  }
}

class TvGenreResponse {
  TvGenreResponse({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory TvGenreResponse.fromJson(Map<String, dynamic> json){
    return TvGenreResponse(
      id: json["id"],
      name: json["name"],
    );
  }

  TvGenre toModel() {
    return TvGenre(
      id: id ?? 0,
      name: name ?? "",
    );
  }

}

class LastEpisodeToAirResponse {
  LastEpisodeToAirResponse({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  final int? id;
  final String? name;
  final String? overview;
  final double? voteAverage;
  final int? voteCount;
  final DateTime? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;

  factory LastEpisodeToAirResponse.fromJson(Map<String, dynamic> json){
    return LastEpisodeToAirResponse(
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeNumber: json["episode_number"],
      episodeType: json["episode_type"],
      productionCode: json["production_code"],
      runtime: json["runtime"],
      seasonNumber: json["season_number"],
      showId: json["show_id"],
      stillPath: json["still_path"],
    );
  }

  LastEpisodeToAir toModel() {
    return LastEpisodeToAir(
      id: id ?? 0,
      name: name ?? "",
      overview: overview ?? "",
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
      airDate: DateFormat("dd MMM yyyy").format(airDate ?? DateTime.now()),
      episodeNumber: episodeNumber ?? 0,
      episodeType: episodeType ?? "",
      productionCode: productionCode ?? "",
      runtime: runtime ?? 0,
      seasonNumber: seasonNumber ?? 0,
      showId: showId ?? 0,
      stillPath: stillPath ?? "",
    );
  }

}

class NetworkResponse {
  NetworkResponse({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  factory NetworkResponse.fromJson(Map<String, dynamic> json){
    return NetworkResponse(
      id: json["id"],
      logoPath: json["logo_path"],
      name: json["name"],
      originCountry: json["origin_country"],
    );
  }

  Network toModel() {
    return Network(
      id: id ?? 0,
      logoPath: logoPath ?? "",
      name: name ?? "",
      originCountry: originCountry ?? "",
    );
  }

}

class ProductionCountryResponse {
  ProductionCountryResponse({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  factory ProductionCountryResponse.fromJson(Map<String, dynamic> json){
    return ProductionCountryResponse(
      iso31661: json["iso_3166_1"],
      name: json["name"],
    );
  }

  ProductionCountry toModel() {
    return ProductionCountry(
      iso31661: iso31661 ?? "",
      name: name ?? "",
    );
  }

}

class SeasonResponse {
  SeasonResponse({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final DateTime? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  factory SeasonResponse.fromJson(Map<String, dynamic> json){
    return SeasonResponse(
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeCount: json["episode_count"],
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      seasonNumber: json["season_number"],
      voteAverage: json["vote_average"],
    );
  }

  Season toModel() {
    return Season(
      airDate: DateFormat("dd MMM yyyy").format(airDate ?? DateTime.now()),
      episodeCount: episodeCount ?? 0,
      id: id ?? 0,
      name: name ?? "",
      overview: overview ?? "",
      posterPath: posterPath ?? "",
      seasonNumber: seasonNumber ?? 0,
      voteAverage: voteAverage ?? 0.0,
    );
  }

}

class SpokenLanguageResponse {
  SpokenLanguageResponse({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String? englishName;
  final String? iso6391;
  final String? name;

  factory SpokenLanguageResponse.fromJson(Map<String, dynamic> json){
    return SpokenLanguageResponse(
      englishName: json["english_name"],
      iso6391: json["iso_639_1"],
      name: json["name"],
    );
  }

  SpokenLanguage toModel() {
    return SpokenLanguage(
      englishName: englishName ?? "",
      iso6391: iso6391 ?? "",
      name: name ?? "",
    );
  }

}
