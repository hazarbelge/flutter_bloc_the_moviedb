import '../services/index.dart';

abstract class BaseRepository<S extends BaseService<dynamic>, T> {
  const BaseRepository(this.service);

  final S service;

  Future<T> fetchData();
}
