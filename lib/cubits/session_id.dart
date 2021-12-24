import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';

import 'base/index.dart';

class SessionIdCubit
    extends RequestCubit<SessionIdRepository, SessionId> {
  SessionIdCubit(SessionIdRepository repository) : super(repository);
}
