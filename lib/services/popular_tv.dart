import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class PopularTvSeriesService extends BaseService<Dio> {
  const PopularTvSeriesService(Dio client) : super(client);

  Future<Response> getPopularTvSeries() async {
    return client.get(Url.popularTv);
  }
}
