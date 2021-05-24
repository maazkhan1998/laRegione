import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laregione/screen/post_screen.dart';

class PostCardWidget extends StatefulWidget {
  final double elevation;
  final String image, title, description,slug;
  final int like, view, height;

  const PostCardWidget(
      {Key key,
      this.elevation = 1,
      @required this.slug,
      this.image,
      this.title,
      this.description,
      this.like,
      this.view,
      this.height})
      : super(key: key);

  @override
  _PostCardWidgetState createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {

  initState(){
    super.initState();
  }

  onTap(){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_)=>PostScreen(widget.slug)
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: widget.elevation,
      child: InkWell(
          onTap: onTap,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                    tag: widget.image,
                    child: Image(
                      image: NetworkImage(widget.image),
                      height: widget.height.toDouble(),
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
                            widget.title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(
                              widget.description,
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
                                    widget.like.toString(),
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
                                    widget.view.toString(),
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
