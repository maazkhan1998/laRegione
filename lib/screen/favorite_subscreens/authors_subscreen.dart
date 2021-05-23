import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/login_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/webServices/models/authorFollowedPostModel.dart';
import '../../widget/post_card_widget.dart';
import '../PageNotFoundScreen.dart';

class AuthorsSubscreen extends StatefulWidget {
  AuthorsSubscreen({Key key}) : super(key: key);

  @override
  _AuthorsSubscreenState createState() => _AuthorsSubscreenState();
}

class _AuthorsSubscreenState extends State<AuthorsSubscreen> {

  HomeBloc _bloc;

  initState(){
    _bloc=HomeBloc();
    _bloc.fetchAuthorFollowedPosts();
    super.initState();
  }

  buildPosts(AuthorFollowedPost posts){
   return ListView(
        padding: EdgeInsets.all(0),
        children:List.generate(posts.data.length,(i)=>Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: PostCardWidget(
              elevation: 3,
              image: posts.data[i].featuredImage,
              title: posts.data[i].title,
              description:
                  posts.data[i].summary,
              like: 254,
              height: 220,
              view: 563,
            ),
          )),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //color: Theme.of(context).backgroundColor,
          child: StreamBuilder<ApiResponse<AuthorFollowedPost>>(
            stream: _bloc.followedPostStream,
            builder: (context,snapshot){
              if (snapshot.hasData) {
                          if (!snapshot.data.isConsumed) {
                            snapshot.data.isConsumed = true;
                            switch (snapshot.data?.apiStatus) {
                              case Status.LOADING:
                                return Center(child: buildLoader);
                                break;
                              case Status.COMPLETED:

                                return buildPosts(snapshot.data.data);
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
          )),
    );
  }
}
