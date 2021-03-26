import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class AiringTodayTvSeriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, Map<String, TvSeriesWrapper>>(
        onLoading: (context, state, value) => CustomProgressIndicator(),
        onLoaded: (context, state, value) {
          var _airingToday = value["airing_today"];
          return Container(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _airingToday.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: CardListTvSeries(
                    image:
                        'https://image.tmdb.org/t/p/w185${_airingToday.results[index].posterPath}',
                    title: _airingToday.results[index].name,
                    vote: _airingToday.results[index].voteAverage,
                    releaseDate: _airingToday.results[index].firstAirDate,
                    overview: _airingToday.results[index].overview,
                    genre: _airingToday.results[index].genreIds
                        .take(3)
                        .map(createGenreContainer)
                        .toList(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: {
                        'title': _airingToday.results[index].name,
                        'imagePoster':
                            'https://image.tmdb.org/t/p/w185${_airingToday.results[index].posterPath}',
                        'rating':
                            double.parse(_airingToday.results[index].voteAverage),
                        'imageBanner':
                            'https://image.tmdb.org/t/p/original${_airingToday.results[index].backdropPath}',
                        'genre': _airingToday.results[index].genreIds
                            .take(3)
                            .map(createGenreContainer)
                            .toList(),
                        'overview': _airingToday.results[index].overview,
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
