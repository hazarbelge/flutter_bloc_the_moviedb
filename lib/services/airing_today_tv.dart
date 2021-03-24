import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class AiringTodayTvSeriesService extends BaseService<Dio> {
  const AiringTodayTvSeriesService(Dio client) : super(client);

  Future<Response> getAiringTodayTvSeries() async {
    return client.get(Url.airingTodayTv);
  }
}
