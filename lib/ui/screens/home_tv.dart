import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_movie_db_flutter/ui/tabs/tv_series/index.dart';

import '../../util/index.dart';

class HomeTvScreen extends StatefulWidget {
  static const route = '/home_tv';

  @override
  State<StatefulWidget> createState() => _HomeTvScreenState();
}

class _HomeTvScreenState extends State<HomeTvScreen> {
  int _currentIndex = 0;

  List<Widget> tabs = [
    AiringTodayTvSeriesTab(),
    OnTheAirTvSeriesTab(),
    PopularTvSeriesTab(),
    TopRatedTvSeriesTab(),
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
            title: context.translate('moviedb.tv_series.airing_today_tv.icon'),
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
            title: context.translate('moviedb.tv_series.on_the_air_tv.icon'),
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
            title: context.translate('moviedb.tv_series.popular_tv.icon'),
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
            title: context.translate('moviedb.tv_series.top_rated_tv.icon'),
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
