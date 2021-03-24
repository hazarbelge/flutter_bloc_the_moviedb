import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class TopRatedMoviesRepository
    extends BaseRepository<TopRatedMoviesService, MovieWrapper> {
  TopRatedMoviesRepository(TopRatedMoviesService service) : super(service);

  @override
  Future<MovieWrapper> fetchData() async {
    final topRatedResponse = await service.getTopRatedMovies();

    return MovieWrapper.fromJson(topRatedResponse.data);
  }
}
