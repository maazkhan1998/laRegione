import 'package:flutter/foundation.dart';

class Post {
  final String image;
  final String title;
  final String text;
  final String date;
  final String authorName;
  final String authorPhoto;

  Post(
      {@required this.image,
      @required this.title,
      @required this.text,
      @required this.date,
      @required this.authorName,
      @required this.authorPhoto});
}
