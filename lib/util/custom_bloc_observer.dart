import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> blocBase) {
    super.onCreate(blocBase);
    debugPrint('onCreate: ${blocBase.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> blocBase, Change<dynamic> change) {
    super.onChange(blocBase, change);
    debugPrint('onChange: ${blocBase.runtimeType}, $change');
  }

  @override
  void onError(BlocBase<dynamic> blocBase, Object error, StackTrace stackTrace) {
    super.onError(blocBase, error, stackTrace);
    debugPrint('onError: ${blocBase.runtimeType}, $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('onEvent: ${bloc.runtimeType}, $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('onTransition: ${bloc.runtimeType}, $transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose: ${bloc.runtimeType}');
  }
}
