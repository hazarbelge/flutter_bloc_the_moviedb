import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';


class TopRatedMoviesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<MoviesCubit>().loadData(),
      child: RequestBuilder<MoviesCubit, Map<String, MovieWrapper>>(
        onLoading: (context, state, value) => CustomProgressIndicator(),
        onLoaded: (context, state, value) {
          var _topRated = value["top_rated"];
          return Container(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _topRated.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: CardListMovies(
                    image:
                    'https://image.tmdb.org/t/p/w185${_topRated.results[index].posterPath}',
                    title: _topRated.results[index].title,
                    vote: _topRated.results[index].voteAverage,
                    releaseDate: _topRated.results[index].releaseDate,
                    overview: _topRated.results[index].overview,
                    genre: _topRated.results[index].genreIds
                        .take(3)
                        .map(createGenreContainer)
                        .toList(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: {
                        'title': _topRated.results[index].title,
                        'imagePoster':
                        'https://image.tmdb.org/t/p/w185${_topRated.results[index].posterPath}',
                        'rating':
                        double.parse(_topRated.results[index].voteAverage),
                        'imageBanner':
                        'https://image.tmdb.org/t/p/original${_topRated.results[index].backdropPath}',
                        'genre': _topRated.results[index].genreIds
                            .take(3)
                            .map(createGenreContainer)
                            .toList(),
                        'overview': _topRated.results[index].overview,
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