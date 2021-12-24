import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/base/request_state.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class AiringTodayTvSeriesTab extends StatelessWidget {
  const AiringTodayTvSeriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, TvSeriesRepository, Map<String, TvSeriesWrapper>>(
        onLoading: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) {
          final TvSeriesWrapper _airingToday = value!["airing_today"]!;
          return SizedBox(
            height: Get.context?.height ?? Get.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _airingToday.results!.length,
                itemExtent: Get.context?.width ?? Get.width / 1.75,
                itemBuilder: (BuildContext context, int index) => CardListTvSeries(
                  image: 'https://image.tmdb.org/t/p/w185${_airingToday.results![index].posterPath}',
                  title: _airingToday.results![index].name,
                  vote: _airingToday.results![index].voteAverage ?? 0.toString(),
                  releaseDate: _airingToday.results![index].firstAirDate ?? "",
                  overview: _airingToday.results![index].overview ?? "",
                  genre: _airingToday.results![index].genreIds!.take(3).map(createGenreContainer).toList(),
                  onTap: () => Get.toNamed(
                    DetailPage.route,
                    arguments: <String, dynamic>{
                      'title': _airingToday.results![index].name,
                      'imagePoster': 'https://image.tmdb.org/t/p/w185${_airingToday.results![index].posterPath}',
                      'rating': double.parse(_airingToday.results![index].voteAverage ?? 0.toString()),
                      'imageBanner': 'https://image.tmdb.org/t/p/original${_airingToday.results![index].backdropPath}',
                      'genre': _airingToday.results![index].genreIds != null ? _airingToday.results![index].genreIds!.take(3).map(createGenreContainer).toList() : const SizedBox(),
                      'overview': _airingToday.results![index].overview,
                      'movieId': _airingToday.results![index].id,
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
