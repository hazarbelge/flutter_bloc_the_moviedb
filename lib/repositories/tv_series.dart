import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class TvSeriesRepository extends BaseRepository<TvSeriesService, Map<String, TvSeriesWrapper>> {
  TvSeriesRepository(TvSeriesService service) : super(service);

  @override
  Future<Map<String, TvSeriesWrapper>> fetchData() async {
    final Response<dynamic> airingTodayResponse = await service.getAiringTodayTvSeries();
    final Response<dynamic> onTheAirResponse = await service.getOnTheAirTvSeries();
    final Response<dynamic> popularResponse = await service.getPopularTvSeries();
    final Response<dynamic> topRatedResponse = await service.getTopRatedTvSeries();

    late final TvSeriesWrapper airingTodayWrapper;
    late final TvSeriesWrapper onTheAirWrapper;
    late final TvSeriesWrapper popularWrapper;
    late final TvSeriesWrapper topRatedWrapper;

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
