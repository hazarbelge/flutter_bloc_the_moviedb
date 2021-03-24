import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class NowPlayingMoviesRepository
    extends BaseRepository<NowPlayingMoviesService, MovieWrapper> {
  NowPlayingMoviesRepository(NowPlayingMoviesService service) : super(service);

  @override
  Future<MovieWrapper> fetchData() async {
    final nowPlayingResponse = await service.getNowPlayingMovies();

    return MovieWrapper.fromJson(nowPlayingResponse.data);
  }
}
