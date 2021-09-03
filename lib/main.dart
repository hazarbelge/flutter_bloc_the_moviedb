import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'cubits/index.dart';
import 'repositories/index.dart';
import 'services/index.dart';
import 'util/index.dart';

Future<void> main() async {
  debugPrint = (String? message, {int? wrapWidth}) {};

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  Bloc.observer = CustomBlocObserver();

  final Dio httpClient = Dio();

  runApp(
    MovieApp(
      moviesRepository: MoviesRepository(MoviesService(httpClient)),
      tvSeriesRepository: TvSeriesRepository(TvSeriesService(httpClient)),
      sessionIdRepository: SessionIdRepository(SessionIdService(httpClient)),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({
    Key? key,
    required this.moviesRepository,
    required this.tvSeriesRepository,
    required this.sessionIdRepository,
  }) : super(key: key);

  final MoviesRepository moviesRepository;
  final TvSeriesRepository tvSeriesRepository;
  final SessionIdRepository sessionIdRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<MoviesCubit>(create: (_) => MoviesCubit(moviesRepository)),
        BlocProvider<TvSeriesCubit>(create: (_) => TvSeriesCubit(tvSeriesRepository)),
        BlocProvider<SessionIdCubit>(create: (_) => SessionIdCubit(sessionIdRepository)),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (BuildContext context, ThemeState state) {},
        builder: (BuildContext context, ThemeState state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter The Movie DB',
          theme: context.watch<ThemeCubit>().lightTheme,
          darkTheme: context.watch<ThemeCubit>().darkTheme,
          themeMode: context.watch<ThemeCubit>().themeMode,
          onGenerateRoute: Routes.generateRoute,
          onUnknownRoute: Routes.errorRoute,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(),
            )..load(const Locale('tr', 'TR')),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        ),
      ),
    );
  }
}
