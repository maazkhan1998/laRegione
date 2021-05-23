import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/login_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/webServices/models/subscribedPost.dart';
import '../../widget/post_card_widget.dart';
import '../PageNotFoundScreen.dart';

class TopicsSubscreen extends StatefulWidget {
  TopicsSubscreen({Key key}) : super(key: key);

  @override
  _TopicsSubscreenState createState() => _TopicsSubscreenState();
}

class _TopicsSubscreenState extends State<TopicsSubscreen> with AutomaticKeepAliveClientMixin {

  HomeBloc _bloc;

  @override
  bool get wantKeepAlive=>true;

  initState(){
    _bloc=HomeBloc();
    _bloc.fetchSubscribedPosts();
    super.initState();
  }

  buildSubscribedPosts(SubscribedPost posts){
   return ListView(
        padding: EdgeInsets.all(0),
        children:List.generate(posts.data.length, (index) => 
        Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: PostCardWidget(
              slug: posts.data[index].slug,
              elevation: 3,
              image: posts.data[index].featuredImage,
              title: posts.data[index].title,
              description:
                  posts.data[index].summary,
              like: 254,
              height: 220,
              view: 563,
            ),
          ))
      );
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
          child:StreamBuilder<ApiResponse<SubscribedPost>>(
            stream: _bloc.subscribedPostStream,
            builder: (context,snapshot){
              if (snapshot.hasData) {
                          if (!snapshot.data.isConsumed) {
                            snapshot.data.isConsumed = true;
                            switch (snapshot.data?.apiStatus) {
                              case Status.LOADING:
                                return Center(child: buildLoader);
                                break;
                              case Status.COMPLETED:

                                return buildSubscribedPosts(snapshot.data.data);
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
          )
           ),
    );
  }
}
