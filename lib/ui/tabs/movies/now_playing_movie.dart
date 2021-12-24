import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
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
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ProductList(
                      productList: _nowPlaying.results,
                      isMovie: true,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
