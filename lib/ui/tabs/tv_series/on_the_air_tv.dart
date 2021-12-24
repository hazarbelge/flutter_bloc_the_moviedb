import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/models/index.dart';
import 'package:the_movie_db_flutter/repositories/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class OnTheAirTvSeriesTab extends StatelessWidget {
  const OnTheAirTvSeriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TvSeriesCubit>().loadData(),
      child: RequestBuilder<TvSeriesCubit, TvSeriesRepository, Map<String, TvSeriesWrapper>>(
        onLoading: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) => const CustomProgressIndicator(),
        onLoaded: (BuildContext context, RequestState<Map<String, TvSeriesWrapper>> state, Map<String, TvSeriesWrapper>? value) {
          final TvSeriesWrapper _onTheAir = value!["on_the_air"]!;
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
                      productList: _onTheAir.results,
                      isMovie: false,
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
