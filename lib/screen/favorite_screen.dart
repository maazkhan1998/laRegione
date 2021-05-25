import 'package:flutter/material.dart';
import 'package:laregione/widget/custom_drawer.dart';
import 'favorite_subscreens/articles_subscreen.dart';
import 'favorite_subscreens/authors_subscreen.dart';
import 'favorite_subscreens/topics_subscreen.dart';
import '../utils/SizeConfig.dart';

class FavoriteScreen extends StatefulWidget {
  final BuildContext rootContext;

  const FavoriteScreen({@required this.rootContext});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData themeData;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) + 72);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: CustomDrawerWidget(),
        backgroundColor: themeData.backgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: Text('Favorites'),
                centerTitle: true,
                pinned: true,
                floating: true,
                bottom: TabBar(
                  //isScrollable: true,
                  tabs: [
                    Tab(child: Text('Topics')),
                    Tab(child: Text('Authors')),
                    Tab(child: Text('Articles')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TopicsSubscreen(),
              AuthorsSubscreen(),
              ArticlesSubscreen()
            ],
          ),
        ),
      ),
    );
  }
}
