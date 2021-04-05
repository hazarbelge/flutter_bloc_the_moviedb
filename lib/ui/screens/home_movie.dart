import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/index.dart';
import '../tabs/movies/index.dart';

class HomeMovieScreen extends StatefulWidget {
  static const route = '/home_movie';

  @override
  State<StatefulWidget> createState() => _HomeMovieScreenState();
}

class _HomeMovieScreenState extends State<HomeMovieScreen> {
  int _currentIndex = 0;

  List<Widget> tabs = [
    NowPlayingMoviesTab(),
    PopularMoviesTab(),
    TopRatedMoviesTab(),
    UpcomingMoviesTab(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkAccentColor,
        title: SizedBox(
          height: 50,
          width: 50,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: SvgPicture.asset("assets/icons/app_icon.svg"),
          ),
        ),
        centerTitle: true,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.grey,
        backgroundColor: darkAccentColor,
        style: TabStyle.react,
        onTap: (index) => _currentIndex != index
            ? setState(() => _currentIndex = index)
            : null,
        initialActiveIndex: _currentIndex,
        items: [
          TabItem(
            title: context.translate('moviedb.movies.now_playing_movie.icon'),
            icon: SvgPicture.asset(
              'assets/icons/app_icon.svg',
              colorBlendMode: BlendMode.srcATop,
              width: 24,
              height: 24,
              color: _currentIndex != 0
                  ? Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).textTheme.caption.color
                      : Colors.black26
                  : Theme.of(context).brightness == Brightness.light
                      ? kIsWeb
                          ? Theme.of(context).textTheme.caption.color
                          : Colors.transparent
                      : Theme.of(context).accentColor,
            ),
          ),
          TabItem(
            title: context.translate('moviedb.movies.popular_movie.icon'),
            icon: SvgPicture.asset(
              'assets/icons/app_icon.svg',
              colorBlendMode: BlendMode.srcATop,
              width: 24,
              height: 24,
              color: _currentIndex != 1
                  ? Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).textTheme.caption.color
                      : Colors.black26
                  : Theme.of(context).brightness == Brightness.light
                      ? kIsWeb
                          ? Theme.of(context).textTheme.caption.color
                          : Colors.transparent
                      : Theme.of(context).accentColor,
            ),
          ),
          TabItem(
            title: context.translate('moviedb.movies.top_rated_movie.icon'),
            icon: SvgPicture.asset(
              'assets/icons/app_icon.svg',
              colorBlendMode: BlendMode.srcATop,
              width: 24,
              height: 24,
              color: _currentIndex != 2
                  ? Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).textTheme.caption.color
                      : Colors.black26
                  : Theme.of(context).brightness == Brightness.light
                      ? kIsWeb
                          ? Theme.of(context).textTheme.caption.color
                          : Colors.transparent
                      : Theme.of(context).accentColor,
            ),
          ),
          TabItem(
            title: context.translate('moviedb.movies.upcoming_movie.icon'),
            icon: SvgPicture.asset(
              'assets/icons/app_icon.svg',
              colorBlendMode: BlendMode.srcATop,
              width: 24,
              height: 24,
              color: _currentIndex != 3
                  ? Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).textTheme.caption.color
                      : Colors.black26
                  : Theme.of(context).brightness == Brightness.light
                      ? kIsWeb
                          ? Theme.of(context).textTheme.caption.color
                          : Colors.transparent
                      : Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
