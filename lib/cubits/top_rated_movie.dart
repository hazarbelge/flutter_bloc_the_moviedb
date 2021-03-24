import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'base/index.dart';

class TopRatedMoviesCubit
    extends RequestCubit<TopRatedMoviesRepository, MovieWrapper> {
  TopRatedMoviesCubit(TopRatedMoviesRepository repository) : super(repository);

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
