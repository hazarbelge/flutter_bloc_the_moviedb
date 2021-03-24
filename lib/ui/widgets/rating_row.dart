import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class RatingRow extends StatelessWidget {
  final double rating;

  const RatingRow({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);
    var stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      var color = i <= rating ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );
      stars.add(star);
    }

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
            Row(children: stars),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 4.0),
              child: Text(
                context.translate("moviedb.details.grade"),
                style: ratingCaptionStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
