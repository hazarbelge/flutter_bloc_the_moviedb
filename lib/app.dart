import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/services/index.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({
    Key? key,
  }) : super(key: key);

  static final GlobalKey appKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Dio _httpClient = Dio();
    _httpClient.options.headers["Content-Type"] = "application/json;charset=utf-8";
    _httpClient.options.headers["Accept"] = "application/json;charset=utf-8";
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<MoviesCubit>(create: (_) => MoviesCubit(MoviesRepository(MoviesService(_httpClient)))),
        BlocProvider<TvSeriesCubit>(create: (_) => TvSeriesCubit(TvSeriesRepository(TvSeriesService(_httpClient)))),
        BlocProvider<SessionIdCubit>(create: (_) => SessionIdCubit(SessionIdRepository(SessionIdService(_httpClient)))),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (BuildContext context, ThemeState state) {},
        builder: (BuildContext context, ThemeState state) => GetMaterialApp(
          key: appKey,
          title: 'Flutter The Movie DB',
          theme: context.watch<ThemeCubit>().lightTheme,
          darkTheme: context.watch<ThemeCubit>().darkTheme,
          themeMode: context.watch<ThemeCubit>().themeMode,
          locale: const Locale("tr", "TR"),
          builder: (BuildContext context, Widget? child) {
            return ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 2460,
              minWidth: 450,
              defaultScale: true,
              breakpoints: const <ResponsiveBreakpoint>[
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(
                color: const Color(0xFFF5F5F5),
              ),
            );
          },
          onGenerateRoute: Routes.generateRoute,
          onUnknownRoute: Routes.errorRoute,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(),
            )..load(const Locale('tr', 'TR')),
            GlobalMaterialLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: (String text, {bool isError = false}) {
            debugPrint("GetXLog: $text");
          },
        ),
      ),
    );
  }
}
