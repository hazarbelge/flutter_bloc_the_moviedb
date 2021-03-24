import 'package:equatable/equatable.dart';

class MovieWrapper {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  MovieWrapper({this.page, this.totalResults, this.totalPages, this.results});

  MovieWrapper.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
  }
}

class Movie extends Equatable {
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

  const Movie(
      {this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      popularity: json['popularity'],
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

  Map<String, dynamic> toJson() => {
    "poster_path": posterPath,
    "adult": adult,
    "overview": overview,
    "release_date": releaseDate,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
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
  List<Object> get props => [
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
