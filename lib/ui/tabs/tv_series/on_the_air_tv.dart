import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class OnTheAirTvSeriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, Map<String, TvSeriesWrapper>>(
        onLoading: (context, state, value) => CustomProgressIndicator(),
        onLoaded: (context, state, value) {
          var _onTheAir = value["on_the_air"];
          return Container(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _onTheAir.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: CardListTvSeries(
                    image:
                        'https://image.tmdb.org/t/p/w185${_onTheAir.results[index].posterPath}',
                    title: _onTheAir.results[index].name,
                    vote: _onTheAir.results[index].voteAverage,
                    releaseDate: _onTheAir.results[index].firstAirDate,
                    overview: _onTheAir.results[index].overview,
                    genre: _onTheAir.results[index].genreIds
                        .take(3)
                        .map(createGenreContainer)
                        .toList(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: {
                        'title': _onTheAir.results[index].name,
                        'imagePoster':
                            'https://image.tmdb.org/t/p/w185${_onTheAir.results[index].posterPath}',
                        'rating':
                            double.parse(_onTheAir.results[index].voteAverage),
                        'imageBanner':
                            'https://image.tmdb.org/t/p/original${_onTheAir.results[index].backdropPath}',
                        'genre': _onTheAir.results[index].genreIds
                            .take(3)
                            .map(createGenreContainer)
                            .toList(),
                        'overview': _onTheAir.results[index].overview,
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
