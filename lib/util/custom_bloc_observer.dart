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
}
