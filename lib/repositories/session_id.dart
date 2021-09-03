import 'package:dio/dio.dart';

import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class SessionIdRepository
    extends BaseRepository<SessionIdService, SessionId> {
  SessionIdRepository(SessionIdService service) : super(service);

  @override
  Future<SessionId> fetchData() async {
    final Response<dynamic> requestTokenResponse = await service.getSessionId();

    return SessionId.fromJson(requestTokenResponse.data);
  }
}
