import 'package:flutter/material.dart';
import '../../widget/post_card_widget.dart';

class ArticlesSubscreen extends StatefulWidget {
  ArticlesSubscreen({Key key}) : super(key: key);

  @override
  _ArticlesSubscreenState createState() => _ArticlesSubscreenState();
}

class _ArticlesSubscreenState extends State<ArticlesSubscreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
          //color: Theme.of(context).backgroundColor,
          child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: PostCardWidget(
              slug: '',
              elevation: 3,
              image: './assets/dummies/featured-1.jpg',
              title: 'Articles',
              description:
                  'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
              like: 254,
              height: 220,
              view: 563,
            ),
          ),
        ],
      )),
    );
  }
}
