import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieWrapper {
  MovieWrapper({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  factory MovieWrapper.fromRawJson(String str) => MovieWrapper.fromJson(json.decode(str));

  factory MovieWrapper.fromJson(Map<String, dynamic> json) {
    return MovieWrapper(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: json["results"] == null ? null : List<Movie>.from(json["results"].map((dynamic x) => Movie.fromJson(x))),
    );
  }

  int page;
  int totalResults;
  int totalPages;
  List<Movie>? results;
}

class Movie extends Equatable {
  const Movie({
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.posterPath,
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      popularity: json['popularity'] == null ? 0.0 : json['popularity'].toDouble(),
      voteCount: json['vote_count'],
      video: json['video'],
      posterPath: json['poster_path'],
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'],
      voteAverage: json['vote_average'].toString(),
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }

  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String title;
  final String voteAverage;
  final String overview;
  final String releaseDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
        "genre_ids": List<dynamic>.from(genreIds.map((int x) => x)),
        "id": id,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "title": title,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "vote_average": voteAverage,
      };

  @override
  List<Object> get props => <Object>[
        popularity,
        voteCount,
        video,
        posterPath,
        id,
        adult,
        backdropPath,
        originalLanguage,
        originalTitle,
        genreIds,
        title,
        voteAverage,
        overview,
        releaseDate,
      ];
}
