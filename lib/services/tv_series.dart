import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class TvSeriesService extends BaseService<Dio> {
  const TvSeriesService(Dio client) : super(client);

  Future<Response> getAiringTodayTvSeries() async {
    return client.get(Url.airingTodayTv);
  }

  Future<Response> getOnTheAirTvSeries() async {
    return client.get(Url.onTheAirTv);
  }

  Future<Response> getPopularTvSeries() async {
    return client.get(Url.popularTv);
  }

  Future<Response> getTopRatedTvSeries() async {
    return client.get(Url.topRatedTv);
  }
}