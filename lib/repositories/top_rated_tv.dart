import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class TopRatedTvSeriesRepository
    extends BaseRepository<TopRatedTvSeriesService, TvSeriesWrapper> {
  TopRatedTvSeriesRepository(TopRatedTvSeriesService service) : super(service);

  @override
  Future<TvSeriesWrapper> fetchData() async {
    final topRatedResponse = await service.getTopRatedTvSeries();

    return TvSeriesWrapper.fromJson(topRatedResponse.data);
  }
}
