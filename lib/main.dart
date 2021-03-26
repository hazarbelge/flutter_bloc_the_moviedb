import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'cubits/index.dart';
import 'repositories/index.dart';
import 'services/index.dart';
import 'util/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedCubit.storage = await HydratedStorage.build();
  Bloc.observer = CustomBlocObserver();

  final httpClient = Dio();

  runApp(MovieApp(
    moviesRepository: MoviesRepository(
      MoviesService(httpClient),
    ),
    tvSeriesRepository: TvSeriesRepository(
      TvSeriesService(httpClient),
    ),
  ));
}

class MovieApp extends StatelessWidget {
  final MoviesRepository moviesRepository;
  final TvSeriesRepository tvSeriesRepository;

  const MovieApp({
    this.moviesRepository,
    this.tvSeriesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
            create: (_) => MoviesCubit(moviesRepository)),
        BlocProvider(
            create: (_) => TvSeriesCubit(tvSeriesRepository)),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) => null,
        builder: (context, state) => MaterialApp(
          title: 'Flutter The Movie DB',
          theme: context.watch<ThemeCubit>().lightTheme,
          darkTheme: context.watch<ThemeCubit>().darkTheme,
          themeMode: context.watch<ThemeCubit>().themeMode,
          onGenerateRoute: Routes.generateRoute,
          onUnknownRoute: Routes.errorRoute,
          localizationsDelegates: [
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(),
            )..load(null),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        ),
      ),
    );
  }
}
