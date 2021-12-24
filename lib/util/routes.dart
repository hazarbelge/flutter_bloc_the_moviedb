import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/screens/index.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case StartScreen.route:
          return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            builder: (_) => const StartScreen(),
          );

        case HomeMovieScreen.route:
          return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            builder: (_) => const HomeMovieScreen(),
          );

        case HomeTvScreen.route:
          return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            builder: (_) => const HomeTvScreen(),
          );

        case DetailPage.route:
          final Map<String, dynamic> args = routeSettings.arguments! as Map<String, dynamic>;
          final Movie? movie = args['movie'] as Movie?;
          final TvSeries? tvSeries = args['tvSeries'] as TvSeries?;
          final bool isMovie = args['isMovie'] as bool;

          return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            builder: (_) => DetailPage(
              movie: movie,
              tvSeries: tvSeries,
              isMovie: isMovie,
            ),
          );

        default:
          return errorRoute(routeSettings);
      }
    } catch (_) {
      return errorRoute(routeSettings);
    }
  }

  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<dynamic>(
      settings: routeSettings,
      builder: (_) => const StartScreen(),
    );
  }
}
