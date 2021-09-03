import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class MoviesService extends BaseService<Dio> {
  const MoviesService(Dio client) : super(client);

  Future<Response<dynamic>> getNowPlayingMovies() async {
    return client.get(Url.nowPlayingMovies);
  }

  Future<Response<dynamic>> getPopularMovies() async {
    return client.get(Url.popularMovies);
  }

  Future<Response<dynamic>> getTopRatedMovies() async {
    return client.get(Url.topRatedMovies);
  }

  Future<Response<dynamic>> getUpcomingMovies() async {
    return client.get(Url.upcomingMovies);
  }

  static Future<Response<dynamic>> rateMovie(int movieId, double rate) async {
    final Dio _client = Dio();
    _client.options.headers["Content-Type"] = "application/json;charset=utf-8";
    final Response<dynamic> response = await _client.post(
      Url.rateMovie(movieId),
      data: <String, dynamic>{
        "value": rate,
      },
    );
    debugPrint(response.data);
    return response;
  }
}
