import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class PopularMoviesService extends BaseService<Dio> {
  const PopularMoviesService(Dio client) : super(client);

  Future<Response> getPopularMovies() async {
    return client.get(Url.popularMovies);
  }
}
