import 'package:flutter/foundation.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'base/index.dart';

class MoviesCubit
    extends RequestCubit<MoviesRepository, Map<String,MovieWrapper>> {
  MoviesCubit(MoviesRepository repository) : super(repository);

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

  Future<void> rateMovie(int movieId, double rate) async {
    try {
      final data = await repository.rateMovie(movieId, rate);
      debugPrint(data.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
