import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase blocBase) {
    super.onCreate(blocBase);
    debugPrint('onCreate: ${blocBase.runtimeType}');
  }

  @override
  void onChange(BlocBase blocBase, Change change) {
    super.onChange(blocBase, change);
    debugPrint('onChange: ${blocBase.runtimeType}, $change');
  }

  @override
  void onError(BlocBase blocBase, Object error, StackTrace stackTrace) {
    super.onError(blocBase, error, stackTrace);
    debugPrint('onError: ${blocBase.runtimeType}, $error');
  }
}
