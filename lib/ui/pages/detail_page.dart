import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.genre,
    required this.title,
    required this.imageBanner,
    required this.imagePoster,
    required this.rating,
    required this.overview,
    required this.movieId,
    required this.isMovie,
  }) : super(key: key);

  static const String route = '/detail';

  final List<Widget> genre;
  final String title;
  final String imageBanner;
  final String imagePoster;
  final double rating;
  final String overview;
  final int movieId;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeCubit>().themeMode == ThemeMode.light ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                HeaderDetail(
                  title: title,
                  imageBanner: imageBanner,
                  imagePoster: imagePoster,
                  rating: rating,
                  genre: genre,
                  movieId: movieId,
                  isMovie: isMovie,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Overview(overview: overview),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
            Positioned(
              top: 20,
              left: 5,
              child: IconButton(icon: const Icon(Icons.arrow_back, size: 36), onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}
