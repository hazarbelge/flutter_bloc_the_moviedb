import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/index.dart';
import 'index.dart';

abstract class RequestCubit<R extends BaseRepository, T>
    extends Cubit<RequestState<T>> {
  final R repository;
  final bool autoLoad;

  RequestCubit(this.repository, {this.autoLoad = true})
      : assert(repository != null),
        super(RequestState.init()) {
    if (autoLoad == true) loadData();
  }

  Future<void> loadData();
}
