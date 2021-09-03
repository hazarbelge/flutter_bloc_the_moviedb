import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class TvSeriesService extends BaseService<Dio> {
  const TvSeriesService(Dio client) : super(client);

  Future<Response<dynamic>> getAiringTodayTvSeries() async {
    return client.get(Url.airingTodayTv);
  }

  Future<Response<dynamic>> getOnTheAirTvSeries() async {
    return client.get(Url.onTheAirTv);
  }

  Future<Response<dynamic>> getPopularTvSeries() async {
    return client.get(Url.popularTv);
  }

  Future<Response<dynamic>> getTopRatedTvSeries() async {
    return client.get(Url.topRatedTv);
  }

  static Future<Response<dynamic>> rateTv(int tvId, double rate) async {
    final Dio _client = Dio();
    _client.options.headers["Content-Type"] = "application/json;charset=utf-8";
    final Response<dynamic> response = await _client.post(
      Url.rateTV(tvId),
      data: <String, dynamic>{
        "value": rate,
      },
    );
    debugPrint(response.data);
    return response;
  }
}
