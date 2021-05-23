import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/models/post.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/PageNotFoundScreen.dart';
import 'package:laregione/screen/login_screen.dart';
import 'package:laregione/screen/post_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/webServices/models/singlePostModel.dart';

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

  HomeBloc _bloc;

  initState(){
    _bloc=HomeBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: widget.elevation,
      child: InkWell(
          onTap: () {
            _bloc=HomeBloc();
            _bloc.fetchSinglePost(widget.slug);
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: StreamBuilder<ApiResponse<SinglePost>>(
                      stream: _bloc.singlePostStream,
                      builder: (context,snapshot){
                        if (snapshot.hasData) {
                          if (!snapshot.data.isConsumed) {
                            snapshot.data.isConsumed = true;
                            switch (snapshot.data?.apiStatus) {
                              case Status.LOADING:
                                return Center(child: buildLoader);
                                break;
                              case Status.COMPLETED:

                                return  PostScreen(
                        post: Post(
                            image: snapshot.data.data.data.featuredImage,
                            title: snapshot.data.data.data.title,
                            text: snapshot.data.data.data.body,
                            date: snapshot.data.data.data.publishedDate,
                            authorName: snapshot.data.data.data.publisher.name,
                            authorPhoto: 'assets/images/avatar-2.jpg'),
                      );
                                break;
                              case Status.ERROR:
                                Fluttertoast.showToast(
                                    msg: snapshot.data.message);
                                return PageNotFoundScreen();
                                break;
                            }
                          }
                        }
                        return Center(child: buildLoader);
                      },
                    ),
                  )));
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                    tag: "article-tag",
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
