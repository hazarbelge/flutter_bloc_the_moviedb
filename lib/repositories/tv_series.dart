import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/services/index.dart';

class TvSeriesRepository extends BaseRepository<TvSeriesService, Map<String, TvSeriesWrapper>> {
  TvSeriesRepository(TvSeriesService service) : super(service);

  @override
  Future<Map<String, TvSeriesWrapper>> fetchData() async {
    late final Response<dynamic> airingTodayResponse, onTheAirResponse, popularResponse, topRatedResponse;

    await Future.wait(
      <Future<dynamic>>[
        service.getAiringTodayTvSeries().then((Response<dynamic> value) => airingTodayResponse = value),
        service.getOnTheAirTvSeries().then((Response<dynamic> value) => onTheAirResponse = value),
        service.getPopularTvSeries().then((Response<dynamic> value) => popularResponse = value),
        service.getTopRatedTvSeries().then((Response<dynamic> value) => topRatedResponse = value),
      ],
    );

    late final TvSeriesWrapper airingTodayWrapper, onTheAirWrapper, popularWrapper, topRatedWrapper;

    await Future.wait(
      <Future<dynamic>>[
        compute(TvSeriesWrapper.fromJson, airingTodayResponse.data as Map<String?, dynamic>).then((TvSeriesWrapper value) => airingTodayWrapper = value),
        compute(TvSeriesWrapper.fromJson, onTheAirResponse.data as Map<String?, dynamic>).then((TvSeriesWrapper value) => onTheAirWrapper = value),
        compute(TvSeriesWrapper.fromJson, popularResponse.data as Map<String?, dynamic>).then((TvSeriesWrapper value) => popularWrapper = value),
        compute(TvSeriesWrapper.fromJson, topRatedResponse.data as Map<String?, dynamic>).then((TvSeriesWrapper value) => topRatedWrapper = value),
      ],
    );

    return <String, TvSeriesWrapper>{
      "airing_today": airingTodayWrapper,
      "on_the_air": onTheAirWrapper,
      "popular": popularWrapper,
      "top_rated": topRatedWrapper,
    };
  }
}
