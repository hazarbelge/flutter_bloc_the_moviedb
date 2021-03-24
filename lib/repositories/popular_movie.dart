import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class PopularMoviesRepository
    extends BaseRepository<PopularMoviesService, MovieWrapper> {
  PopularMoviesRepository(PopularMoviesService service) : super(service);

  @override
  Future<MovieWrapper> fetchData() async {
    final popularResponse = await service.getPopularMovies();

    return MovieWrapper.fromJson(popularResponse.data);
  }
}
