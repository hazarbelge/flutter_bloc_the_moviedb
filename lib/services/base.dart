abstract class BaseService<S> {
  final S client;

  const BaseService(this.client) : assert(client != null);
}
