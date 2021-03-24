import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class UpcomingMoviesService extends BaseService<Dio> {
  const UpcomingMoviesService(Dio client) : super(client);

  Future<Response> getUpcomingMovies() async {
    return client.get(Url.upcomingMovies);
  }
}
