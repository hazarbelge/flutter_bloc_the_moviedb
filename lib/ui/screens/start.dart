import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/ui/screens/index.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class StartScreen extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightAccentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CachedNetworkImage(
                      imageUrl: Url.appLogoUrl,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(context.translate('app.title'),
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ),
            Center(
              child: SizedBox(
                height: 150,
                width: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => darkAccentColor)),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            HomeMovieScreen.route,
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            context.translate("moviedb.movies.title"),
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => darkAccentColor)),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            HomeTvScreen.route,
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            context.translate("moviedb.tv_series.title"),
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
