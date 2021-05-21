import 'package:flutter/material.dart';
import '../utils/SizeConfig.dart';
import '../widget/topic_widget.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Topics'),
          centerTitle: true,
        ),
        body: ListView(
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
                        onTap: () => {} //Navigator.pushNamed(
                        //context, Routes.topicPosts)),
                        ),
                    TopicsWidget(
                        id: 2,
                        image: 'assets/topics/lifestyle.jpg',
                        title: "Life Style",
                        description: '325 articles',
                        onTap: () => {}
                        // Navigator.pushNamed(context, Routes.topicPosts)),
                        ),
                    TopicsWidget(
                        id: 3,
                        image: 'assets/topics/fashion.jpg',
                        title: "Fashion",
                        description: '784 articles',
                        onTap: () => {}),
                    TopicsWidget(
                        id: 4,
                        image: 'assets/topics/art.jpg',
                        title: "Art",
                        description: '124 articles',
                        onTap: () =>
                            {} //Navigator.pushNamed(context, Routes.topicPosts)
                        ),
                    //Navigator.pushNamed(context, Routes.topicPosts)),
                  ]),
            ),
          ],
        ));
  }
}
