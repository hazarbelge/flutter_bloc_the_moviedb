import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class PopularTvSeriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, Map<String, TvSeriesWrapper>>(
        onLoading: (context, state, value) => CustomProgressIndicator(),
        onLoaded: (context, state, value) {
          var _popular = value["popular"];
          return Container(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _popular.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: CardListTvSeries(
                    image:
                        'https://image.tmdb.org/t/p/w185${_popular.results[index].posterPath}',
                    title: _popular.results[index].name,
                    vote: _popular.results[index].voteAverage,
                    releaseDate: _popular.results[index].firstAirDate,
                    overview: _popular.results[index].overview,
                    genre: _popular.results[index].genreIds
                        .take(3)
                        .map(createGenreContainer)
                        .toList(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: {
                        'title': _popular.results[index].name,
                        'imagePoster':
                            'https://image.tmdb.org/t/p/w185${_popular.results[index].posterPath}',
                        'rating':
                            double.parse(_popular.results[index].voteAverage),
                        'imageBanner':
                            'https://image.tmdb.org/t/p/original${_popular.results[index].backdropPath}',
                        'genre': _popular.results[index].genreIds
                            .take(3)
                            .map(createGenreContainer)
                            .toList(),
                        'overview': _popular.results[index].overview,
                        'movieId': _popular.results[index].id,
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
