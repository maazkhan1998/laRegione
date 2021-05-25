import 'package:flutter/material.dart';
import '../screen/post/post_screen.dart';

class MyFeaturedNewsWidget extends StatefulWidget {
  final String image, date, title, description, slug;
  final int view;

  MyFeaturedNewsWidget(
      {Key key,
      @required this.slug,
      @required this.image,
      @required this.date,
      @required this.title,
      @required this.description,
      @required this.view})
      : super(key: key);

  @override
  _MyFeaturedNewsWidgetState createState() => _MyFeaturedNewsWidgetState();
}

class _MyFeaturedNewsWidgetState extends State<MyFeaturedNewsWidget> {
  onTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PostScreen(widget.slug)));
  }

  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    return InkWell(
        onTap: onTap,
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
                        image: NetworkImage(widget.image),
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
                            widget.date,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Text(
                              widget.description,
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
