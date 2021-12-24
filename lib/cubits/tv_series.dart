import '../models/index.dart';
import '../repositories/index.dart';
import 'base/index.dart';

class TvSeriesCubit extends RequestCubit<TvSeriesRepository, Map<String, TvSeriesWrapper>> {
  TvSeriesCubit(TvSeriesRepository repository) : super(repository);
}
