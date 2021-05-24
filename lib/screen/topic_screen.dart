import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/PageNotFoundScreen.dart';
import 'package:laregione/screen/topic_posts_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/webServices/models/topicPostModel.dart';
import 'package:laregione/widget/custom_drawer.dart';
import '../utils/SizeConfig.dart';
import '../widget/topic_widget.dart';
import 'login_screen.dart';

class TopicsScreen extends StatefulWidget {
  final BuildContext rootContext;
  static const String routeName = '/topics';

  const TopicsScreen({@required this.rootContext});

  @override
  _TopicsScreenState createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData themeData;

  HomeBloc _bloc;

  initState(){
    _bloc=HomeBloc();
    _bloc.fetchTopicPosts();
    super.initState();
  }

  buildTopics(TopicPost posts){
   return ListView(
          children: <Widget>[
            Container(
              child: ListView(
                  padding: EdgeInsets.all(MySize.size16),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: List.generate(posts.data.length, (index) =>
                  TopicsWidget(
                        id: posts.data[index].id,
                        image: posts.data[index].featuredImage,
                        title: posts.data[index].title,
                        description: posts.data[index].summary,
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TopicPostsScreen(
                                        headerImage:
                                            'assets/topics/technology.jpg',
                                        topicName: "Technology",
                                      )))
                            } //Navigator.pushNamed(
                        //context, Routes.topicPosts)),
                        ),)),
            ),
          ],
        );
  }

  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      drawer: MyDrawerWidget(),
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Topics'),
          centerTitle: true,
        ),
        body:StreamBuilder<ApiResponse<TopicPost>>(
          stream: _bloc.topicPostStream,
          builder: (context,snapshot){
            if (snapshot.hasData) {
                          if (!snapshot.data.isConsumed) {
                            snapshot.data.isConsumed = true;
                            switch (snapshot.data?.apiStatus) {
                              case Status.LOADING:
                                return Center(child: buildLoader);
                                break;
                              case Status.COMPLETED:

                                return buildTopics(snapshot.data.data);
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
        ));
  }
}
