import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class TopRatedTvSeriesService extends BaseService<Dio> {
  const TopRatedTvSeriesService(Dio client) : super(client);

  Future<Response> getTopRatedTvSeries() async {
    return client.get(Url.topRatedTv);
  }
}
