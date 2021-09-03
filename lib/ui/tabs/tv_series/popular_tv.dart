import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/base/index.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class PopularTvSeriesTab extends StatelessWidget {
  const PopularTvSeriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, TvSeriesRepository, Map<String, TvSeriesWrapper>>(
        onLoading: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) {
          final TvSeriesWrapper _popular = value!["popular"]!;
          return SizedBox(
            height: Get.context?.height ?? Get.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _popular.results!.length,
                itemExtent: Get.context?.width ?? Get.width / 1.75,
                itemBuilder: (BuildContext context, int index) => CardListTvSeries(
                    image: 'https://image.tmdb.org/t/p/w185${_popular.results![index].posterPath}',
                    title: _popular.results![index].name,
                    vote: _popular.results![index].voteAverage ?? 0.toString(),
                    releaseDate: _popular.results![index].firstAirDate ?? "",
                    overview: _popular.results![index].overview ?? "",
                    genre: _popular.results![index].genreIds!.take(3).map(createGenreContainer).toList(),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailPage.route,
                        arguments: <String, dynamic>{
                          'title': _popular.results![index].name,
                          'imagePoster': 'https://image.tmdb.org/t/p/w185${_popular.results![index].posterPath}',
                          'rating': double.parse(_popular.results![index].voteAverage ?? 0.toString()),
                          'imageBanner': 'https://image.tmdb.org/t/p/original${_popular.results![index].backdropPath}',
                          'genre': _popular.results![index].genreIds != null ? _popular.results![index].genreIds!.take(3).map(createGenreContainer).toList() : const SizedBox(),
                          'overview': _popular.results![index].overview,
                          'movieId': _popular.results![index].id,
                          'isMovie': false,
                        },
                      );
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
