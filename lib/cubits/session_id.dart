import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'base/index.dart';

class SessionIdCubit
    extends RequestCubit<SessionIdRepository, SessionId> {
  SessionIdCubit(SessionIdRepository repository) : super(repository);

  @override
  Future<void> loadData() async {
    emit(RequestState<SessionId>.loading(state.value));

    try {
      final SessionId data = await repository.fetchData();

      emit(RequestState<SessionId>.loaded(data));
    } catch (e) {
      emit(RequestState<SessionId>.error(e.toString()));
    }
  }
}
