import 'package:dio/dio.dart';
import 'package:the_movie_db_flutter/util/index.dart';
import 'index.dart';

class SessionIdService extends BaseService<Dio> {
  const SessionIdService(Dio client) : super(client);

  Future<Response> getSessionId() async {
    return client.get(
        Url.sessionIdUrl,
    );
  }
}
