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
    nowPlayingMoviesRepository: NowPlayingMoviesRepository(
      NowPlayingMoviesService(httpClient),
    ),
    popularMoviesRepository: PopularMoviesRepository(
      PopularMoviesService(httpClient),
    ),
    topRatedMoviesRepository: TopRatedMoviesRepository(
      TopRatedMoviesService(httpClient),
    ),
    upcomingMoviesRepository: UpcomingMoviesRepository(
      UpcomingMoviesService(httpClient),
    ),
    airingTodayTvSeriesRepository: AiringTodayTvSeriesRepository(
      AiringTodayTvSeriesService(httpClient),
    ),
    onTheAirTvSeriesRepository: OnTheAirTvSeriesRepository(
      OnTheAirTvSeriesService(httpClient),
    ),
    popularTvSeriesRepository: PopularTvSeriesRepository(
      PopularTvSeriesService(httpClient),
    ),
    topRatedTvSeriesRepository: TopRatedTvSeriesRepository(
      TopRatedTvSeriesService(httpClient),
    ),
  ));
}

class MovieApp extends StatelessWidget {
  final NowPlayingMoviesRepository nowPlayingMoviesRepository;
  final PopularMoviesRepository popularMoviesRepository;
  final TopRatedMoviesRepository topRatedMoviesRepository;
  final UpcomingMoviesRepository upcomingMoviesRepository;
  final AiringTodayTvSeriesRepository airingTodayTvSeriesRepository;
  final OnTheAirTvSeriesRepository onTheAirTvSeriesRepository;
  final PopularTvSeriesRepository popularTvSeriesRepository;
  final TopRatedTvSeriesRepository topRatedTvSeriesRepository;

  const MovieApp({
    this.nowPlayingMoviesRepository,
    this.popularMoviesRepository,
    this.topRatedMoviesRepository,
    this.upcomingMoviesRepository,
    this.airingTodayTvSeriesRepository,
    this.onTheAirTvSeriesRepository,
    this.popularTvSeriesRepository,
    this.topRatedTvSeriesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
            create: (_) => NowPlayingMoviesCubit(nowPlayingMoviesRepository)),
        BlocProvider(
            create: (_) => PopularMoviesCubit(popularMoviesRepository)),
        BlocProvider(
            create: (_) => TopRatedMoviesCubit(topRatedMoviesRepository)),
        BlocProvider(
            create: (_) => UpcomingMoviesCubit(upcomingMoviesRepository)),
        BlocProvider(
            create: (_) => PopularTvSeriesCubit(popularTvSeriesRepository)),
        BlocProvider(
            create: (_) => TopRatedTvSeriesCubit(topRatedTvSeriesRepository)),
        BlocProvider(
            create: (_) => AiringTodayTvSeriesCubit(airingTodayTvSeriesRepository)),
        BlocProvider(
            create: (_) => OnTheAirTvSeriesCubit(onTheAirTvSeriesRepository)),
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
