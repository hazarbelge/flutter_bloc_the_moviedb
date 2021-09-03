import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'base/index.dart';

class MoviesCubit
    extends RequestCubit<MoviesRepository, Map<String,MovieWrapper>> {
  MoviesCubit(MoviesRepository repository) : super(repository);

  @override
  Future<void> loadData() async {
    emit(RequestState<Map<String,MovieWrapper>>.loading(state.value));

    try {
      final Map<String, MovieWrapper> data = await repository.fetchData();

      emit(RequestState<Map<String,MovieWrapper>>.loaded(data));
    } catch (e) {
      emit(RequestState<Map<String,MovieWrapper>>.error(e.toString()));
    }
  }
}
