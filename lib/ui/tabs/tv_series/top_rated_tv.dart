import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/base/index.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class TopRatedTvSeriesTab extends StatelessWidget {
  const TopRatedTvSeriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, TvSeriesRepository, Map<String, TvSeriesWrapper>>(
        onLoading: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) {
          final TvSeriesWrapper _topRated = value!["top_rated"]!;
          return SizedBox(
            height: Get.context?.height ?? Get.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _topRated.results!.length,
                itemExtent: Get.context?.width ?? Get.width / 1.75,
                itemBuilder: (BuildContext context, int index) => CardListTvSeries(
                  image: 'https://image.tmdb.org/t/p/w185${_topRated.results![index].posterPath}',
                  title: _topRated.results![index].name,
                  vote: _topRated.results![index].voteAverage ?? 0.toString(),
                  releaseDate: _topRated.results![index].firstAirDate ?? "",
                  overview: _topRated.results![index].overview ?? "",
                  genre: _topRated.results![index].genreIds!.take(3).map(createGenreContainer).toList(),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: <String, dynamic>{
                        'title': _topRated.results![index].name,
                        'imagePoster': 'https://image.tmdb.org/t/p/w185${_topRated.results![index].posterPath}',
                        'rating': double.parse(_topRated.results![index].voteAverage ?? 0.toString()),
                        'imageBanner': 'https://image.tmdb.org/t/p/original${_topRated.results![index].backdropPath}',
                        'genre': _topRated.results![index].genreIds != null ? _topRated.results![index].genreIds!.take(3).map(createGenreContainer).toList() : const SizedBox(),
                        'overview': _topRated.results![index].overview,
                        'movieId': _topRated.results![index].id,
                        'isMovie': false,
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
