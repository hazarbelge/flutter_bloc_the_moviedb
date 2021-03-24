import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class TopRatedMoviesService extends BaseService<Dio> {
  const TopRatedMoviesService(Dio client) : super(client);

  Future<Response> getTopRatedMovies() async {
    return client.get(Url.topRatedMovies);
  }
}
