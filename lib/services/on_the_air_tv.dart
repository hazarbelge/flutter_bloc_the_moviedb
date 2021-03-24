import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class OnTheAirTvSeriesService extends BaseService<Dio> {
  const OnTheAirTvSeriesService(Dio client) : super(client);

  Future<Response> getOnTheAirTvSeries() async {
    return client.get(Url.onTheAirTv);
  }
}
