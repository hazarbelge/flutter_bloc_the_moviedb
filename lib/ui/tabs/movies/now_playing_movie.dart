import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/base/request_state.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class NowPlayingMoviesTab extends StatelessWidget {
  const NowPlayingMoviesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<MoviesCubit>().loadData(),
      child: RequestBuilder<MoviesCubit, MoviesRepository, Map<String, MovieWrapper>>(
        onLoading: (BuildContext context, RequestState<Map<String, MovieWrapper>> state, Map<String, MovieWrapper>? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<Map<String, MovieWrapper>> state, Map<String, MovieWrapper>? value) {
          final MovieWrapper _nowPlaying = value!["now_playing"]!;
          return SizedBox(
            height: Get.context?.height ?? Get.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: _nowPlaying.results!.length,
                itemExtent: Get.context?.width ?? Get.width / 1.75,
                itemBuilder: (BuildContext context, int index) => CardListMovies(
                  image: 'https://image.tmdb.org/t/p/w185${_nowPlaying.results![index].posterPath}',
                  title: _nowPlaying.results![index].title,
                  vote: _nowPlaying.results![index].voteAverage,
                  releaseDate: _nowPlaying.results![index].releaseDate,
                  overview: _nowPlaying.results![index].overview,
                  genre: _nowPlaying.results![index].genreIds.take(3).map(createGenreContainer).toList(),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.route,
                      arguments: <String, dynamic>{
                        'title': _nowPlaying.results![index].title,
                        'imagePoster': 'https://image.tmdb.org/t/p/w185${_nowPlaying.results![index].posterPath}',
                        'rating': double.parse(_nowPlaying.results![index].voteAverage),
                        'imageBanner': 'https://image.tmdb.org/t/p/original${_nowPlaying.results![index].backdropPath}',
                        'genre': _nowPlaying.results![index].genreIds.take(3).map(createGenreContainer).toList(),
                        'overview': _nowPlaying.results![index].overview,
                        'movieId': _nowPlaying.results![index].id,
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
