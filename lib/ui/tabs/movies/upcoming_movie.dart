import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';

class UpcomingMoviesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<MoviesCubit>().loadData(),
      child: RequestBuilder<MoviesCubit, Map<String, MovieWrapper>>(
        onLoading: (context, state, value) => CustomProgressIndicator(),
        onLoaded: (context, state, value) {
          var _upcoming = value["upcoming"];
          return Container(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _upcoming.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: CardListMovies(
                    image:
                        'https://image.tmdb.org/t/p/w185${_upcoming.results[index].posterPath}',
                    title: _upcoming.results[index].title,
                    vote: _upcoming.results[index].voteAverage,
                    releaseDate: _upcoming.results[index].releaseDate,
                    overview: _upcoming.results[index].overview,
                    genre: _upcoming.results[index].genreIds
                        .take(3)
                        .map(createGenreContainer)
                        .toList(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: {
                        'title': _upcoming.results[index].title,
                        'imagePoster':
                            'https://image.tmdb.org/t/p/w185${_upcoming.results[index].posterPath}',
                        'rating':
                            double.parse(_upcoming.results[index].voteAverage),
                        'imageBanner':
                            'https://image.tmdb.org/t/p/original${_upcoming.results[index].backdropPath}',
                        'genre': _upcoming.results[index].genreIds
                            .take(3)
                            .map(createGenreContainer)
                            .toList(),
                        'overview': _upcoming.results[index].overview,
                        'movieId': _upcoming.results[index].id,
                        'isMovie': true,
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
