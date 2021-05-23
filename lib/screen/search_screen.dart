import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: new EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 8, right: 12, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 8),
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search here",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    isDense: true,
                                  ),
                                  maxLines: 1,
                                  textInputAction: TextInputAction.search,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSubmitted: (text) {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      _searchHistoryWidget('History 1'),
                      _searchHistoryWidget('History 2'),
                      _searchHistoryWidget('History 3'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.sentiment_dissatisfied,
                      size: 32,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text("No Result!",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Text("Try with something else",
                        style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchHistoryWidget(String suggestion) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.history,
            size: 22,
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: Text(
                  suggestion,
                )),
          )
        ],
      ),
    );
  }
}
