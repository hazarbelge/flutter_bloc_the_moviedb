import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/screens/index.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic> args = routeSettings.arguments;

      switch (routeSettings.name) {
        case StartScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => StartScreen(),
          );

        case HomeMovieScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => HomeMovieScreen(),
          );

        case HomeTvScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => HomeTvScreen(),
          );

        case DetailPage.route:
          final title = args['title'] as String;
          final imagePoster = args['imagePoster'] as String;
          final rating = args['rating'] as double;
          final imageBanner = args['imageBanner'] as String;
          final genre = args['genre'] as List<Widget>;
          final overview = args['overview'] as String;
          final movieId = args['movieId'] as int;
          final isMovie = args['isMovie'] as bool;

          return MaterialPageRoute(
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
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => StartScreen(),
    );
  }
}
