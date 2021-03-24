import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/models/genres.dart';


Widget createGenreContainer(int id) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(8),
    child: Text(
      Genres.genres[id],
      style: TextStyle(fontSize: 12),
    ),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)
    ),
  );
}
