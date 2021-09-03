import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/cubits/base/request_state.dart';
import 'package:the_movie_db_flutter/cubits/session_id.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/screens/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightAccentColor,
      body: RequestBuilder<SessionIdCubit, SessionIdRepository, SessionId>(
        onLoading: (BuildContext context, RequestState<SessionId> state, SessionId? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<SessionId> state, SessionId? value) {
          Url.sessionId = value?.guestSessionId ?? "";
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.network(
                        Url.appLogoUrl,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          context.translate('app.title'),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                          width: 150,
                          child: TextButton(
                            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => darkAccentColor)),
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
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 60,
                          width: 150,
                          child: TextButton(
                            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => darkAccentColor)),
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
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
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
          );
        },
      ),
    );
  }
}
