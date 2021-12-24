import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';

import 'base/index.dart';

class MoviesCubit extends RequestCubit<MoviesRepository, Map<String, MovieWrapper>> {
  MoviesCubit(MoviesRepository repository) : super(repository);
}
