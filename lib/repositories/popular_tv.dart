import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class PopularTvSeriesRepository
    extends BaseRepository<PopularTvSeriesService, TvSeriesWrapper> {
  PopularTvSeriesRepository(PopularTvSeriesService service) : super(service);

  @override
  Future<TvSeriesWrapper> fetchData() async {
    final popularResponse = await service.getPopularTvSeries();

    return TvSeriesWrapper.fromJson(popularResponse.data);
  }
}
