import '../models/index.dart';
import '../repositories/index.dart';
import 'base/index.dart';

class OnTheAirTvSeriesCubit
    extends RequestCubit<OnTheAirTvSeriesRepository, TvSeriesWrapper> {
  OnTheAirTvSeriesCubit(OnTheAirTvSeriesRepository repository) : super(repository);

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
