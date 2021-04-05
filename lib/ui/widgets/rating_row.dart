import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/services/index.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class RatingRow extends StatefulWidget {
  final double rating;
  final int movieId;
  final bool isMovie;

  const RatingRow({Key key, this.rating, this.movieId, this.isMovie})
      : super(key: key);

  @override
  _RatingRowState createState() => _RatingRowState(rating, movieId, isMovie);
}

class _RatingRowState extends State<RatingRow> {
  final double rating;
  final int movieId;
  final bool isMovie;

  _RatingRowState(this.rating, this.movieId, this.isMovie);

  bool isRated = false;
  double rate = 0.5;
  ThemeData theme;
  TextTheme textTheme;
  TextStyle ratingCaptionStyle;
  Color color;

  List<Widget> getStars() {
    var stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      color = !isRated
          ? i * 2 <= rating
              ? theme.accentColor
              : Colors.black12
          : i * 2 <= rate
              ? Colors.orange
              : Colors.black12;
      var star = GestureDetector(
        onTap: () {
          setState(() {
            isRated = true;
            rate = (i * 2).toDouble();
          });
        },
        child: Icon(
          Icons.star,
          color: color,
        ),
      );
      stars.add(star);
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    textTheme = theme.textTheme;
    ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              rating.toString(),
              style: textTheme.headline6.copyWith(
                fontWeight: FontWeight.w400,
                color: theme.accentColor,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              context.translate("moviedb.details.rating"),
              style: ratingCaptionStyle,
            ),
          ],
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: getStars(),
                ),
                isRated
                    ? SizedBox(
                        height: 30,
                        width: 50,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => darkAccentColor)),
                          onPressed: () {
                            isMovie
                                ? MoviesService.rateMovie(movieId, rate)
                                : TvSeriesService.rateTv(movieId, rate);
                          },
                          child: Text(
                            context.translate("moviedb.details.grade"),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 4.0),
              child: Row(
                children: [
                  Text(
                    context.translate("moviedb.details.grade"),
                    style: ratingCaptionStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
