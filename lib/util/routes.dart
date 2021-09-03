import 'package:flutter/material.dart';
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
          final String title = args['title'] as String;
          final String imagePoster = args['imagePoster'] as String;
          final double rating = args['rating'] as double;
          final String imageBanner = args['imageBanner'] as String;
          final List<Widget> genre = args['genre'] as List<Widget>;
          final String overview = args['overview'] as String;
          final int movieId = args['movieId'] as int;
          final bool isMovie = args['isMovie'] as bool;

          return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            builder: (_) => DetailPage(
              title: title,
              imagePoster: imagePoster,
              rating: rating,
              imageBanner: imageBanner,
              genre: genre,
              overview: overview,
              movieId: movieId,
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
