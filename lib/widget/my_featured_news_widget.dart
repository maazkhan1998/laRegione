import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/models/post.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/PageNotFoundScreen.dart';
import 'package:laregione/screen/login_screen.dart';
import 'package:laregione/screen/post_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/webServices/models/singlePostModel.dart';

class MyFeaturedNewsWidget extends StatefulWidget {
  final String image, date, title, description,slug;
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

  HomeBloc _bloc;

  initState(){
    _bloc=HomeBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    return InkWell(
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
