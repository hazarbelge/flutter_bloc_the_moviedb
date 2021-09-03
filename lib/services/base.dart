abstract class BaseService<S> {
  const BaseService(this.client) : assert(client != null);

  final S client;
}
