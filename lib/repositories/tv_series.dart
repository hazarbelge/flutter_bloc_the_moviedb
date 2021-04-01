import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class TvSeriesRepository
    extends BaseRepository<TvSeriesService, Map<String, TvSeriesWrapper>> {
  TvSeriesRepository(TvSeriesService service) : super(service);

  @override
  Future<Map<String, TvSeriesWrapper>> fetchData() async {
    final airingTodayResponse = await service.getAiringTodayTvSeries();
    final onTheAirResponse = await service.getOnTheAirTvSeries();
    final popularResponse = await service.getPopularTvSeries();
    final topRatedResponse = await service.getTopRatedTvSeries();

    return {
      "airing_today": TvSeriesWrapper.fromJson(airingTodayResponse.data),
      "on_the_air": TvSeriesWrapper.fromJson(onTheAirResponse.data),
      "popular": TvSeriesWrapper.fromJson(popularResponse.data),
      "top_rated": TvSeriesWrapper.fromJson(topRatedResponse.data),
    };
  }

  Future<dynamic> rateTv(int tvId, double rate) async {
    final response = await service.rateTv(tvId, rate);
    return response.data;
  }
}
