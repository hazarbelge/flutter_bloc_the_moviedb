import 'package:dio/dio.dart';

import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class TvSeriesRepository
    extends BaseRepository<TvSeriesService, Map<String, TvSeriesWrapper>> {
  TvSeriesRepository(TvSeriesService service) : super(service);

  @override
  Future<Map<String, TvSeriesWrapper>> fetchData() async {
    final Response<dynamic> airingTodayResponse = await service.getAiringTodayTvSeries();
    final Response<dynamic> onTheAirResponse = await service.getOnTheAirTvSeries();
    final Response<dynamic> popularResponse = await service.getPopularTvSeries();
    final Response<dynamic> topRatedResponse = await service.getTopRatedTvSeries();

    return <String, TvSeriesWrapper>{
      "airing_today": TvSeriesWrapper.fromJson(airingTodayResponse.data),
      "on_the_air": TvSeriesWrapper.fromJson(onTheAirResponse.data),
      "popular": TvSeriesWrapper.fromJson(popularResponse.data),
      "top_rated": TvSeriesWrapper.fromJson(topRatedResponse.data),
    };
  }
}
