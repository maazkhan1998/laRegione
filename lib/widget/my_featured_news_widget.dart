import 'package:flutter/material.dart';
import '../models/post.dart';
import '../screen/post/post_screen.dart';

class MyFeaturedNewsWidget extends StatelessWidget {
  final String image, date, title, description;
  final int view;

  const MyFeaturedNewsWidget(
      {Key key,
      @required this.image,
      @required this.date,
      @required this.title,
      @required this.description,
      @required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new PostScreen(
                        post: Post(
                            image: image,
                            title: title,
                            text: description,
                            date: date,
                            authorName: 'test',
                            authorPhoto: 'assets/images/avatar-2.jpg'),
                      )));
        },
        child: Container(
          padding: EdgeInsets.only(left: 0, right: 0, bottom: 16),
          child: Card(
            elevation: 0,
            margin: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Hero(
                      tag: "article-tag",
                      child: Image(
                        image: AssetImage(image),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            date,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Text(
                              description,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
