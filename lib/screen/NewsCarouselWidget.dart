/*
* File : News Carousel
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:laregione/AppTheme.dart';
import 'package:laregione/AppThemeNotifier.dart';
import 'package:laregione/widget/my_featured_news_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class NewsCarouselWidget extends StatefulWidget {
  @override
  _NewsCarouselWidgetState createState() => _NewsCarouselWidgetState();
}

class _NewsCarouselWidgetState extends State<NewsCarouselWidget> {
   ThemeData themeData;

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? themeData.colorScheme.primary
            : themeData.colorScheme.primary.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return SafeArea(
              top: true,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: themeData.scaffoldBackgroundColor,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(MdiIcons.chevronLeft),
                    ),
                    title: Text(
                      "World News",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600),
                    ),
                  ),
                  body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = 0;
                  });
                },
                children: <Widget>[
                  PageView(
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p1.jpg',
                        title: "News 1 Group 1",
                        date: "June 18, 2020",
                        description: _newsContent,
                        view: 290,
                      ),
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p2.jpg',
                        title: "News 2 Group 1",
                        date: "April 12, 2020",
                        description: _newsContent,
                        view: 3481,
                      ),
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p3.jpg',
                        title: "News 3 Group 1",
                        date: "Feb 14, 2020",
                        description: _newsContent,
                        view: 4852,
                      ),
                    ],
                  ),

                  PageView(
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p1.jpg',
                        title: "News 1 Group 2",
                        date: "June 18, 2020",
                        description: _newsContent,
                        view: 290,
                      ),
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p2.jpg',
                        title: "News 2 Group 2",
                        date: "April 12, 2020",
                        description: _newsContent,
                        view: 3481,
                      ),
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p3.jpg',
                        title: "News 3 Group 2",
                        date: "Feb 14, 2020",
                        description: _newsContent,
                        view: 4852,
                      ),
                    ],
                  ),

                  PageView(
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p1.jpg',
                        title: "News 1 Group 3",
                        date: "June 18, 2020",
                        description: _newsContent,
                        view: 290,
                      ),
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p2.jpg',
                        title: "News 2 Group 3",
                        date: "April 12, 2020",
                        description: _newsContent,
                        view: 3481,
                      ),
                      MyFeaturedNewsWidget(
                        image: './assets/images/all/all-p3.jpg',
                        title: "News 3 Group 3",
                        date: "Feb 14, 2020",
                        description: _newsContent,
                        view: 4852,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicatorStatic(),
            ),
          ),
        ],
      )),
            );
      },
    );
  }
}
