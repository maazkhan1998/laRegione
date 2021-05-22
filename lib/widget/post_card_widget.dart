import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laregione/models/post.dart';
import 'package:laregione/screen/post_screen.dart';

class PostCardWidget extends StatelessWidget {
  final double elevation;
  final String image, title, description;
  final int like, view, height;

  const PostCardWidget(
      {Key key,
      this.elevation = 1,
      this.image,
      this.title,
      this.description,
      this.like,
      this.view,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: elevation,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PostScreen(
                      post: Post(
                          image: this.image,
                          title: this.title,
                          text: this.description,
                          date: '12/05/21',
                          authorName: 'Arthur Melo',
                          authorPhoto: 'assets/images/avatar-2.jpg'),
                    )));
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                    tag: "article-tag",
                    child: Image(
                      image: AssetImage(image),
                      height: height.toDouble(),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(
                              description,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: Text(
                                    like.toString(),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Icon(
                                      Icons.comment,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      size: 20,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: Text(
                                    view.toString(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
