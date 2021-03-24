import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/ui/widgets/index.dart';

class DetailPage extends StatelessWidget {
  static const route = '/movie_detail';

  final List<Widget> genre;
  final String title;
  final String imageBanner;
  final String imagePoster;
  final double rating;
  final String overview;

  const DetailPage({Key key, this.genre, this.title, this.imageBanner, this.imagePoster, this.rating, this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                HeaderDetail(
                  title: title,
                  imageBanner: imageBanner,
                  imagePoster: imagePoster,
                  rating: rating,
                  genre: genre,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Overview(overview),
                ),
                SizedBox(height: 50.0),
              ],
            ),
            Positioned(
              top: 20,
              left: 5,
              child: IconButton(icon: Icon(Icons.arrow_back, size: 36), onPressed: () => Navigator.pop(context)),
            ),
          ],
        )
      ),
    );
  }

}
