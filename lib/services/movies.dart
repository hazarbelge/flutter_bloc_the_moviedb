import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class MoviesService extends BaseService<Dio> {
  const MoviesService(Dio client) : super(client);

  Future<Response> getNowPlayingMovies() async {
    return client.get(Url.nowPlayingMovies);
  }
  Future<Response> getPopularMovies() async {
    return client.get(Url.popularMovies);
  }
  Future<Response> getTopRatedMovies() async {
    return client.get(Url.topRatedMovies);
  }
  Future<Response> getUpcomingMovies() async {
    return client.get(Url.upcomingMovies);
  }
}
