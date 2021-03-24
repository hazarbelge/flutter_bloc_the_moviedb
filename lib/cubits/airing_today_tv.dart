import '../models/index.dart';
import '../repositories/index.dart';
import 'base/index.dart';

class AiringTodayTvSeriesCubit
    extends RequestCubit<AiringTodayTvSeriesRepository, TvSeriesWrapper> {
  AiringTodayTvSeriesCubit(AiringTodayTvSeriesRepository repository) : super(repository);

  @override
  Future<void> loadData() async {
    emit(RequestState.loading(state.value));

    try {
      final data = await repository.fetchData();

      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
