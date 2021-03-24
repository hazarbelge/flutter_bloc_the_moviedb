import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class OnTheAirTvSeriesRepository
    extends BaseRepository<OnTheAirTvSeriesService, TvSeriesWrapper> {
  OnTheAirTvSeriesRepository(OnTheAirTvSeriesService service) : super(service);

  @override
  Future<TvSeriesWrapper> fetchData() async {
    final onTheAirResponse = await service.getOnTheAirTvSeries();

    return TvSeriesWrapper.fromJson(onTheAirResponse.data);
  }
}
