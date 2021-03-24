import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';
import 'package:the_movie_db_flutter/ui/pages/index.dart';


class UpcomingMoviesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RequestBuilder<UpcomingMoviesCubit, MovieWrapper>(
      onLoading: (context, state, value) => CustomProgressIndicator(),
      onLoaded: (context, state, value) => Container(
        child: Center(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: value.results.length,
            itemBuilder: (context, index) => GestureDetector(
              child: CardListMovies(
                image: 'https://image.tmdb.org/t/p/w185${value.results[index].posterPath}',
                title: value.results[index].title,
                vote: value.results[index].voteAverage,
                releaseDate: value.results[index].releaseDate,
                overview: value.results[index].overview,
                genre: value.results[index].genreIds.take(3).map(createGenreContainer).toList(),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailPage.route,
                  arguments: {
                    'title': value.results[index].title,
                    'imagePoster': 'https://image.tmdb.org/t/p/w185${value.results[index].posterPath}',
                    'rating': double.parse(value.results[index].voteAverage),
                    'imageBanner': 'https://image.tmdb.org/t/p/original${value.results[index].backdropPath}',
                    'genre': value.results[index].genreIds.take(3).map(createGenreContainer).toList(),
                    'overview': value.results[index].overview,
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}