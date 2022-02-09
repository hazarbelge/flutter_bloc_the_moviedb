import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class MoviesRepository extends BaseRepository<MoviesService, Map<String, MovieWrapper>> {
  MoviesRepository(MoviesService service) : super(service);

  @override
  Future<Map<String, MovieWrapper>> fetchData() async {
    final Response<dynamic> nowPlayingResponse = await service.getNowPlayingMovies();
    final Response<dynamic> popularResponse = await service.getPopularMovies();
    final Response<dynamic> topRatedResponse = await service.getTopRatedMovies();
    final Response<dynamic> upcomingResponse = await service.getUpcomingMovies();

    late final MovieWrapper nowPlayingWrapper;
    late final MovieWrapper popularWrapper;
    late final MovieWrapper topRatedWrapper;
    late final MovieWrapper upcomingWrapper;

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
