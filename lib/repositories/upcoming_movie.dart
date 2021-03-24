import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class UpcomingMoviesRepository
    extends BaseRepository<UpcomingMoviesService, MovieWrapper> {
  UpcomingMoviesRepository(UpcomingMoviesService service) : super(service);

  @override
  Future<MovieWrapper> fetchData() async {
    final upcomingResponse = await service.getUpcomingMovies();

    return MovieWrapper.fromJson(upcomingResponse.data);
  }
}
