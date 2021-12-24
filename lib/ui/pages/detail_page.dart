import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.movie,
    required this.tvSeries,
    required this.isMovie,
  }) : super(key: key);

  static const String route = '/detail';

  final Movie? movie;
  final TvSeries? tvSeries;
  final bool? isMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeCubit>().themeMode == ThemeMode.light ? Colors.white : Colors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: isMovie == null
              ? const SizedBox()
              : (isMovie ?? false)
                  ? Column(
                      children: <Widget>[
                        HeaderDetail(
                          title: movie!.title ?? "",
                          imageBanner: 'https://image.tmdb.org/t/p/original${movie!.backdropPath ?? ""}',
                          imagePoster: 'https://image.tmdb.org/t/p/w185${movie!.posterPath ?? ""}',
                          rating: double.parse(movie!.voteAverage ?? "0"),
                          genre: movie?.genreIds.take(3).map(createGenreContainer).toList() ?? <Widget>[],
                          id: movie!.id,
                          isMovie: true,
                        ),
                        DetailTabNavigation(
                          movie: movie,
                          tvSeries: tvSeries,
                          isMovie: isMovie,
                        ),
                        const SizedBox(height: 50.0),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        HeaderDetail(
                          title: tvSeries!.name,
                          imageBanner: 'https://image.tmdb.org/t/p/original${tvSeries!.backdropPath ?? ""}',
                          imagePoster: 'https://image.tmdb.org/t/p/w185${tvSeries!.posterPath ?? ""}',
                          rating: double.parse(tvSeries!.voteAverage ?? "0"),
                          genre: tvSeries?.genreIds?.take(3).map(createGenreContainer).toList() ?? <Widget>[],
                          id: tvSeries!.id,
                          isMovie: false,
                        ),
                        DetailTabNavigation(
                          movie: movie,
                          tvSeries: tvSeries,
                          isMovie: isMovie,
                        ),
                        const SizedBox(height: 50.0),
                      ],
                    ),
        ),
      ),
    );
  }
}

class DetailTabNavigation extends StatelessWidget {
  const DetailTabNavigation({
    Key? key,
    required this.movie,
    required this.tvSeries,
    required this.isMovie,
  }) : super(key: key);

  final Movie? movie;
  final TvSeries? tvSeries;
  final bool? isMovie;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
    final List<Widget> _detailTabs = <Widget>[
      Overview(
        overview: isMovie != null
            ? isMovie!
                ? movie!.overview ?? ""
                : tvSeries!.overview ?? ""
            : "",
      ),
    ];
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: size.width,
          height: 70,
          color: Get.isDarkMode ? Colors.white12 : Colors.grey[200],
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ((size.width - (_detailTabs.length - 1 * 15)) / _detailTabs.length) - 44,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex.value != 0) {
                      currentIndex.value = 0;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Overview",
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (BuildContext context, int indexValue, Widget? widgetValue) {
                return _detailTabs[currentIndex.value];
              },
            ),
          ),
        ),
      ],
    );
  }
}
