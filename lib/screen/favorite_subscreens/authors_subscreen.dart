import 'package:flutter/material.dart';
import '../../widget/post_card_widget.dart';

class AuthorsSubscreen extends StatefulWidget {
  AuthorsSubscreen({Key key}) : super(key: key);

  @override
  _AuthorsSubscreenState createState() => _AuthorsSubscreenState();
}

class _AuthorsSubscreenState extends State<AuthorsSubscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //color: Theme.of(context).backgroundColor,
          child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: PostCardWidget(
              elevation: 3,
              image: './assets/dummies/featured-1.jpg',
              title: 'Authors',
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
