import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class NowPlayingMoviesService extends BaseService<Dio> {
  const NowPlayingMoviesService(Dio client) : super(client);

  Future<Response> getNowPlayingMovies() async {
    return client.get(Url.nowPlayingMovies);
  }
}
