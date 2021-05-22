import 'package:flutter/material.dart';
import '../../utils/routes.dart';

class InfoScreen extends StatelessWidget {
  static const String routeName = '/info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(Icons.lock,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      "Privacy \& Security",
                    ),
                  ),
                ),
                Container(
                  child: Icon(Icons.chevron_right,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.3,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(Icons.face,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.contact),
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        "Help \& Support",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Icon(Icons.chevron_right,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.3,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(Icons.help,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/info/about'),
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        "About",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Icon(Icons.chevron_right,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.3,
          ),
        ],
      ),
    );
  }
}
