import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class Overview extends StatefulWidget {
  final String overview;

  Overview(this.overview);

  @override
  _OverviewState createState() => _OverviewState(overview);
}

class _OverviewState extends State<Overview> {
  final String overview;

  _OverviewState(this.overview);

  bool flag = true;
  String visibleText, invisibleText;
  int subLength = 100;

  @override
  void initState() {
    if (overview.length > subLength) {
      visibleText = overview.substring(0, subLength);
      invisibleText = overview.substring(subLength, overview.length);
    } else {
      visibleText = overview;
      invisibleText = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate("moviedb.details.overview"),
          style: textTheme.subtitle1.copyWith(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          flag ? "$visibleText..." : visibleText + invisibleText,
          style: textTheme.bodyText2.copyWith(
            color: Colors.black45,
            fontSize: 16.0,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              flag = !flag;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                flag ? context.translate("moviedb.details.more") : context.translate("moviedb.details.less"),
                style: textTheme.bodyText2
                    .copyWith(fontSize: 16.0, color: theme.accentColor),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18.0,
                color: theme.accentColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
