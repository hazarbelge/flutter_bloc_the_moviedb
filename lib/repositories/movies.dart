import 'package:dio/dio.dart';

import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class MoviesRepository
    extends BaseRepository<MoviesService, Map<String,MovieWrapper>> {
  MoviesRepository(MoviesService service) : super(service);

  @override
  Future<Map<String,MovieWrapper>> fetchData() async {
    final Response<dynamic> nowPlayingResponse = await service.getNowPlayingMovies();
    final Response<dynamic> popularResponse = await service.getPopularMovies();
    final Response<dynamic> topRatedResponse = await service.getTopRatedMovies();
    final Response<dynamic> upcomingResponse = await service.getUpcomingMovies();

    return <String, MovieWrapper>{
      "now_playing": MovieWrapper.fromJson(nowPlayingResponse.data),
      "popular": MovieWrapper.fromJson(popularResponse.data),
      "top_rated": MovieWrapper.fromJson(topRatedResponse.data),
      "upcoming": MovieWrapper.fromJson(upcomingResponse.data)
    };
  }
}
