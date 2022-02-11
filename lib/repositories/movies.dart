import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/services/index.dart';

class MoviesRepository extends BaseRepository<MoviesService, Map<String, MovieWrapper>> {
  MoviesRepository(MoviesService service) : super(service);

  @override
  Future<Map<String, MovieWrapper>> fetchData() async {
    late final Response<dynamic> nowPlayingResponse, popularResponse, topRatedResponse, upcomingResponse;

    await Future.wait(
      <Future<dynamic>>[
        service.getNowPlayingMovies().then((Response<dynamic> value) => nowPlayingResponse = value),
        service.getPopularMovies().then((Response<dynamic> value) => popularResponse = value),
        service.getTopRatedMovies().then((Response<dynamic> value) => topRatedResponse = value),
        service.getUpcomingMovies().then((Response<dynamic> value) => upcomingResponse = value),
      ],
    );

    late final MovieWrapper nowPlayingWrapper, popularWrapper, topRatedWrapper, upcomingWrapper;

    await Future.wait(
      <Future<dynamic>>[
        compute(MovieWrapper.fromJson, nowPlayingResponse.data as Map<String?, dynamic>).then((MovieWrapper value) => nowPlayingWrapper = value),
        compute(MovieWrapper.fromJson, popularResponse.data as Map<String?, dynamic>).then((MovieWrapper value) => popularWrapper = value),
        compute(MovieWrapper.fromJson, topRatedResponse.data as Map<String?, dynamic>).then((MovieWrapper value) => topRatedWrapper = value),
        compute(MovieWrapper.fromJson, upcomingResponse.data as Map<String?, dynamic>).then((MovieWrapper value) => upcomingWrapper = value),
      ],
    );

    return <String, MovieWrapper>{
      "now_playing": nowPlayingWrapper,
      "popular": popularWrapper,
      "top_rated": topRatedWrapper,
      "upcoming": upcomingWrapper,
    };
  }
}
