import 'dart:convert';

import 'package:equatable/equatable.dart';

class TvSeriesWrapper {
  int page;
  int totalResults;
  int totalPages;
  List<TvSeries> results;

  TvSeriesWrapper({this.page, this.totalResults, this.totalPages, this.results});

  TvSeriesWrapper.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <TvSeries>[];
      json['results'].forEach((v) {
        results.add(new TvSeries.fromJson(v));
      });
    }
  }
}

class TvSeries extends Equatable {
  TvSeries({
    this.posterPath,
    this.popularity,
    this.id,
    this.backdropPath,
    this.voteAverage,
    this.overview,
    this.firstAirDate,
    this.originCountry,
    this.genreIds,
    this.originalLanguage,
    this.voteCount,
    this.name,
    this.originalName,
  });

  final String posterPath;
  final double popularity;
  final int id;
  final String backdropPath;
  final String voteAverage;
  final String overview;
  final String firstAirDate;
  final List<String> originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final int voteCount;
  final String name;
  final String originalName;

  factory TvSeries.fromRawJson(String str) => TvSeries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvSeries.fromJson(Map<String, dynamic> json) => TvSeries(
    posterPath: json["poster_path"],
    popularity: json["popularity"],
    id: json["id"],
    backdropPath: json["backdrop_path"],
    voteAverage: json["vote_average"].toString(),
    overview: json["overview"],
    firstAirDate: json["first_air_date"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    genreIds: json['genre_ids'].cast<int>(),
    originalLanguage: json["original_language"],
    voteCount: json["vote_count"],
    name: json["name"],
    originalName: json["original_name"],
  );

  Map<String, dynamic> toJson() => {
    "poster_path": posterPath,
    "popularity": popularity,
    "id": id,
    "backdrop_path": backdropPath,
    "vote_average": voteAverage,
    "overview": overview,
    "first_air_date": firstAirDate,
    "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "original_language": originalLanguage,
    "vote_count": voteCount,
    "name": name,
    "original_name": originalName,
  };

  @override
  List<Object> get props => [
    posterPath,
    popularity,
    id,
    backdropPath,
    voteAverage,
    overview,
    firstAirDate,
    originCountry,
    genreIds,
    originalLanguage,
    voteCount,
    name,
    originalName,
  ];
}
