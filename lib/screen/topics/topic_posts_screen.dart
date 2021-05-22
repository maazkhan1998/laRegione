import 'package:flutter/material.dart';
import '../../utils/app_theme.dart';
import '../../widget/post_card_widget.dart';

class TopicPostsScreen extends StatefulWidget {
  static const String routeName = '/topic/posts';
  final String headerImage;
  final String topicName;

  const TopicPostsScreen({Key key, this.headerImage, this.topicName})
      : super(key: key);

  @override
  _TopicPostsScreenState createState() => _TopicPostsScreenState();
}

class _TopicPostsScreenState extends State<TopicPostsScreen> {
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.20,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: "topic-tag-1",
                  child: ColorFiltered(
                    child: Image(
                        image: AssetImage(widget.headerImage),
                        fit: BoxFit.fitWidth),
                    colorFilter:
                        ColorFilter.mode(Colors.grey[500], BlendMode.darken),
                  ),
                ),
                title: Text(
                  widget.topicName,
                  style:
                      TextStyle(color: AppTheme.defaultTheme.backgroundColor),
                ),
                titlePadding: EdgeInsets.only(left: 20, bottom: 15, right: 20),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  PostCardWidget(
                    elevation: 3,
                    image: './assets/dummies/featured-1.jpg',
                    title: 'At Mountain',
                    description:
                        'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
                    like: 254,
                    height: 220,
                    view: 563,
                  ),
                  SizedBox(height: 20),
                ]),
              ),
            )
          ],
        ),
        onRefresh: () {
          return;
        },
      ),
    );
  }
}
