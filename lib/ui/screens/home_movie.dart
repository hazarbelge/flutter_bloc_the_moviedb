import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

import '../../util/index.dart';
import '../tabs/movies/index.dart';

class HomeMovieScreen extends StatelessWidget {
  const HomeMovieScreen({Key? key}) : super(key: key);

  static const String route = '/home_movie';

  Color getMyColor(int bottomBarIndex, int itemIndex) {
    Color color;
    if (bottomBarIndex != itemIndex) {
      if (Get.theme == Style.light) {
        color = Colors.white;
      } else {
        color = Colors.black26;
      }
    } else if (Get.theme == Style.light) {
      if (kIsWeb) {
        color = Colors.white;
      } else {
        color = Colors.transparent;
      }
    } else {
      color = Colors.white;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
    const List<Widget> tabs = <Widget>[
      NowPlayingMoviesTab(),
      PopularMoviesTab(),
      TopRatedMoviesTab(),
      UpcomingMoviesTab(),
    ];
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (BuildContext context, int currentIndex, Widget? widgetValue) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: tabs[currentIndex],
          bottomNavigationBar: ConvexAppBar(
            color: Colors.grey,
            backgroundColor: darkAccentColor,
            style: TabStyle.react,
            onTap: (int index) => currentIndex != index ? _currentIndex.value = index : null,
            initialActiveIndex: currentIndex,
            items: <TabItem<SvgPicture>>[
              TabItem<SvgPicture>(
                title: context.translate('moviedb.movies.now_playing_movie.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 0),
                ),
              ),
              TabItem<SvgPicture>(
                title: context.translate('moviedb.movies.popular_movie.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 1),
                ),
              ),
              TabItem<SvgPicture>(
                title: context.translate('moviedb.movies.top_rated_movie.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 2),
                ),
              ),
              TabItem<SvgPicture>(
                title: context.translate('moviedb.movies.upcoming_movie.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 3),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
