import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/services/index.dart';

import '../../repositories/index.dart';
import 'index.dart';

abstract class RequestCubit<R extends BaseRepository<BaseService<dynamic>, dynamic>, T> extends Cubit<RequestState<T>> {
  RequestCubit(this.repository, {this.autoLoad = true}) : super(RequestState<T>.init()) {
    if (autoLoad == true) {
      loadData();
    }
  }

  final R repository;
  final bool autoLoad;

  Future<void> loadData();
}
