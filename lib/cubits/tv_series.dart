import '../models/index.dart';
import '../repositories/index.dart';
import 'base/index.dart';

class TvSeriesCubit
    extends RequestCubit<TvSeriesRepository, Map<String, TvSeriesWrapper>> {
  TvSeriesCubit(TvSeriesRepository repository) : super(repository);

  @override
  Future<void> loadData() async {
    emit(RequestState<Map<String, TvSeriesWrapper>>.loading(state.value));

    try {
      final Map<String, TvSeriesWrapper> data = await repository.fetchData();

      emit(RequestState<Map<String, TvSeriesWrapper>>.loaded(data));
    } catch (e) {
      emit(RequestState<Map<String, TvSeriesWrapper>>.error(e.toString()));
    }
  }
}
