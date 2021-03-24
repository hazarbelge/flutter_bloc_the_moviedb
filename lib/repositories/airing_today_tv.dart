import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class AiringTodayTvSeriesRepository
    extends BaseRepository<AiringTodayTvSeriesService, TvSeriesWrapper> {
  AiringTodayTvSeriesRepository(AiringTodayTvSeriesService service) : super(service);

  @override
  Future<TvSeriesWrapper> fetchData() async {
    final airingTodayResponse = await service.getAiringTodayTvSeries();

    return TvSeriesWrapper.fromJson(airingTodayResponse.data);
  }
}
