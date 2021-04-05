import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class MoviesRepository
    extends BaseRepository<MoviesService, Map<String,MovieWrapper>> {
  MoviesRepository(MoviesService service) : super(service);

  @override
  Future<Map<String,MovieWrapper>> fetchData() async {
    final nowPlayingResponse = await service.getNowPlayingMovies();
    final popularResponse = await service.getPopularMovies();
    final topRatedResponse = await service.getTopRatedMovies();
    final upcomingResponse = await service.getUpcomingMovies();

    return {
      "now_playing": MovieWrapper.fromJson(nowPlayingResponse.data),
      "popular": MovieWrapper.fromJson(popularResponse.data),
      "top_rated": MovieWrapper.fromJson(topRatedResponse.data),
      "upcoming": MovieWrapper.fromJson(upcomingResponse.data)
    };
  }
}
