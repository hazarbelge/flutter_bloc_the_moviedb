import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/ui/tabs/tv_series/index.dart';

import '../../util/index.dart';

class HomeTvScreen extends StatelessWidget {
  const HomeTvScreen({Key? key}) : super(key: key);

  static const String route = '/home_tv';

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
      AiringTodayTvSeriesTab(),
      OnTheAirTvSeriesTab(),
      PopularTvSeriesTab(),
      TopRatedTvSeriesTab(),
    ];
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (BuildContext context, int currentIndex, Widget? widgetValue) {
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
          body: tabs[currentIndex],
          bottomNavigationBar: ConvexAppBar(
            color: Colors.grey,
            backgroundColor: darkAccentColor,
            style: TabStyle.react,
            onTap: (int index) => currentIndex != index ? _currentIndex.value = index : null,
            initialActiveIndex: currentIndex,
            items: <TabItem<SvgPicture>>[
              TabItem<SvgPicture>(
                title: context.translate('moviedb.tv_series.airing_today_tv.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 0),
                ),
              ),
              TabItem<SvgPicture>(
                title: context.translate('moviedb.tv_series.on_the_air_tv.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 1),
                ),
              ),
              TabItem<SvgPicture>(
                title: context.translate('moviedb.tv_series.popular_tv.icon'),
                icon: SvgPicture.asset(
                  'assets/icons/app_icon.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: getMyColor(currentIndex, 2),
                ),
              ),
              TabItem<SvgPicture>(
                title: context.translate('moviedb.tv_series.top_rated_tv.icon'),
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

