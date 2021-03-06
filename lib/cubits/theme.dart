import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../util/index.dart';

enum ThemeState { light, dark, black, system }

final Map<ThemeState, ThemeData> _themeData = <ThemeState, ThemeData>{
  ThemeState.light: Style.light,
  ThemeState.dark: Style.dark,
  ThemeState.black: Style.black,
};

/// Saves and loads information regarding the theme setting.
class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(defaultTheme);

  static const ThemeState defaultTheme = ThemeState.system;

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState.values[json['value']];
  }

  @override
  Map<String, int> toJson(ThemeState state) {
    return <String, int>{
      'value': state.index,
    };
  }

  ThemeState get theme => state;

  set themeSet(ThemeState themeState) => emit(themeState);

  /// Returns appropiate theme mode
  ThemeMode get themeMode {
    switch (state) {
      case ThemeState.light:
        return ThemeMode.light;
      case ThemeState.dark:
        return ThemeMode.dark;
      case ThemeState.black:
        return ThemeMode.dark;
      default:
        return ThemeMode.dark;
    }
  }

  /// Default light theme
  ThemeData? get lightTheme => _themeData[ThemeState.light];

  /// Default dark theme
  ThemeData? get darkTheme => state == ThemeState.black ? _themeData[ThemeState.black] : _themeData[ThemeState.dark];
}
