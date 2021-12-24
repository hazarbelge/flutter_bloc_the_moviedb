import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/base/index.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class OnTheAirTvSeriesTab extends StatelessWidget {
  const OnTheAirTvSeriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, TvSeriesRepository, Map<String, TvSeriesWrapper>>(
        onLoading: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) {
          final TvSeriesWrapper _onTheAir = value!["on_the_air"]!;
          return SizedBox(
            height: Get.context?.height ?? Get.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _onTheAir.results!.length,
                itemExtent: Get.context?.width ?? Get.width / 1.75,
                itemBuilder: (BuildContext context, int index) => CardListTvSeries(
                  image: 'https://image.tmdb.org/t/p/w185${_onTheAir.results![index].posterPath}',
                  title: _onTheAir.results![index].name,
                  vote: _onTheAir.results![index].voteAverage ?? 0.toString(),
                  releaseDate: _onTheAir.results![index].firstAirDate ?? "",
                  overview: _onTheAir.results![index].overview ?? "",
                  genre: _onTheAir.results![index].genreIds!.take(3).map(createGenreContainer).toList(),
                  onTap: () => Get.toNamed(
                    DetailPage.route,
                    arguments: <String, dynamic>{
                      'title': _onTheAir.results![index].name,
                      'imagePoster': 'https://image.tmdb.org/t/p/w185${_onTheAir.results![index].posterPath}',
                      'rating': double.parse(_onTheAir.results![index].voteAverage ?? 0.toString()),
                      'imageBanner': 'https://image.tmdb.org/t/p/original${_onTheAir.results![index].backdropPath}',
                      'genre': _onTheAir.results![index].genreIds != null ? _onTheAir.results![index].genreIds!.take(3).map(createGenreContainer).toList() : const SizedBox(),
                      'overview': _onTheAir.results![index].overview,
                      'movieId': _onTheAir.results![index].id,
                      'isMovie': false,
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
