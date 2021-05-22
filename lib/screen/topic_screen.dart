import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/topic_posts_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
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

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Topics'),
          centerTitle: true,
        ),
        body:StreamBuilder(
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

                                return loginButton;
                                break;
                              case Status.ERROR:
                                Fluttertoast.showToast(
                                    msg: snapshot.data.message);
                                return loginButton;
                                break;
                            }
                          }
                        }
                        return Center(child: buildLoader);
          },
        ) 
        
        ListView(
          children: <Widget>[
            Container(
              child: ListView(
                  padding: EdgeInsets.all(MySize.size16),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    TopicsWidget(
                        id: 1,
                        image: 'assets/topics/technology.jpg',
                        title: "Technology",
                        description: '241 articles',
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TopicPostsScreen(
                                        headerImage:
                                            'assets/topics/technology.jpg',
                                        topicName: "Technology",
                                      )))
                            } //Navigator.pushNamed(
                        //context, Routes.topicPosts)),
                        ),
                    TopicsWidget(
                        id: 2,
                        image: 'assets/topics/lifestyle.jpg',
                        title: "Life Style",
                        description: '325 articles',
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TopicPostsScreen(
                                        headerImage:
                                            'assets/topics/lifestyle.jpg',
                                        topicName: "Life Style",
                                      )))
                            }),
                    TopicsWidget(
                        id: 3,
                        image: 'assets/topics/fashion.jpg',
                        title: "Fashion",
                        description: '784 articles',
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TopicPostsScreen(
                                        headerImage:
                                            'assets/topics/fashion.jpg',
                                        topicName: "Fashion",
                                      )))
                            }),
                    TopicsWidget(
                        id: 4,
                        image: 'assets/topics/art.jpg',
                        title: "Art",
                        description: '124 articles',
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TopicPostsScreen(
                                        headerImage:
                                            'assets/topics/fashion.jpg',
                                        topicName: "Art",
                                      )))
                            }),
                    //Navigator.pushNamed(context, Routes.topicPosts)),
                  ]),
            ),
          ],
        ));
  }
}
