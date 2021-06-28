import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class NowPlayingMoviesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () => context.read<MoviesCubit>().loadData(),
      child: RequestBuilder<MoviesCubit, Map<String, MovieWrapper>>(
        onLoading: (context, state, value) => CustomProgressIndicator(),
        onLoaded: (context, state, value) {
          var _nowPlaying = value["now_playing"];
          return Container(
            height: size.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _nowPlaying.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: CardListMovies(
                    image:
                        'https://image.tmdb.org/t/p/w185${_nowPlaying.results[index].posterPath}',
                    title: _nowPlaying.results[index].title,
                    vote: _nowPlaying.results[index].voteAverage,
                    releaseDate: _nowPlaying.results[index].releaseDate,
                    overview: _nowPlaying.results[index].overview,
                    genre: _nowPlaying.results[index].genreIds
                        .take(3)
                        .map(createGenreContainer)
                        .toList(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: {
                        'title': _nowPlaying.results[index].title,
                        'imagePoster':
                            'https://image.tmdb.org/t/p/w185${_nowPlaying.results[index].posterPath}',
                        'rating':
                            double.parse(_nowPlaying.results[index].voteAverage),
                        'imageBanner':
                            'https://image.tmdb.org/t/p/original${_nowPlaying.results[index].backdropPath}',
                        'genre': _nowPlaying.results[index].genreIds
                            .take(3)
                            .map(createGenreContainer)
                            .toList(),
                        'overview': _nowPlaying.results[index].overview,
                        'movieId': _nowPlaying.results[index].id,
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
