import 'package:flutter/material.dart';
import 'package:laregione/widget/post_card_widget.dart';

class TopicsSubscreen extends StatefulWidget {
  TopicsSubscreen({Key key}) : super(key: key);

  @override
  _TopicsSubscreenState createState() => _TopicsSubscreenState();
}

class _TopicsSubscreenState extends State<TopicsSubscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: PostCardWidget(
              elevation: 3,
              image: './assets/dummies/featured-1.jpg',
              title: 'Topics',
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
