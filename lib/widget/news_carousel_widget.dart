import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/PageNotFoundScreen.dart';
import 'package:laregione/screen/login_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/widget/custom_drawer.dart';
import 'my_featured_news_widget.dart';

import '../webServices/models/homePostModel.dart';

class NewsCarouselWidget extends StatefulWidget {
  @override
  _NewsCarouselWidgetState createState() => _NewsCarouselWidgetState();
}

class _NewsCarouselWidgetState extends State<NewsCarouselWidget> {
  ThemeData themeData;

  HomeBloc _bloc;

  int _numPages;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  initState() {
    _bloc = HomeBloc();
    _bloc.fetchHomePost();
    super.initState();
  }

  List<Widget> _buildPageIndicatorStatic(int pages) {
    List<Widget> list = [];
    for (int i = 0; i < pages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  buildNews(HomePost posts) {
    _numPages = posts.data.articles.length;
    return StatefulBuilder(
      builder: (context, state) {
        List<Widget> widgets = [];
        widgets.add(PageView(
          pageSnapping: true,
          physics: ClampingScrollPhysics(),
          onPageChanged: (int page) {
            state(() => _currentPage = page);
          },
          children: List.generate(
              posts.data.articles.length,
              (i) => MyFeaturedNewsWidget(
                    slug: posts.data.articles[i].slug,
                    image: posts.data.articles[i].featuredImage,
                    title: posts.data.articles[i].title,
                    date: posts.data.articles[i].publisher.created.toString(),
                    description: posts.data.articles[i].summary,
                    view: 290,
                  )),
        ));

        for (int i = 0; i < posts.data.topics.length; i++) {
          widgets.add(
            PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                onPageChanged: (int page) {
                  state(() => _currentPage = page);
                },
                children: List.generate(
                    posts.data.topics[i].length,
                    (index) => MyFeaturedNewsWidget(
                          slug: posts.data.topics[i][index].slug,
                          image: posts.data.topics[i][index].featuredImage,
                          title: posts.data.topics[i][index].title,
                          date: posts.data.topics[i][index].publishedDate
                              .toString(),
                          description: posts.data.topics[i][index].summary,
                          view: 290,
                        ))),
          );
        }

        for (int i = 0; i < posts.data.publishers.length; i++) {
          widgets.add(
            PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                onPageChanged: (int page) {
                  state(() => _currentPage = page);
                },
                children: List.generate(
                    posts.data.publishers[i].length,
                    (index) => MyFeaturedNewsWidget(
                          slug: posts.data.publishers[i][index].slug,
                          image: posts.data.publishers[i][index].featuredImage,
                          title: posts.data.publishers[i][index].title,
                          date: posts.data.publishers[i][index].publishedDate
                              .toString(),
                          description: posts.data.publishers[i][index].summary,
                          view: 290,
                        ))),
          );
        }

        widgets.add(PageView(
          pageSnapping: true,
          physics: ClampingScrollPhysics(),
          onPageChanged: (int page) {
            state(() => _currentPage = page);
          },
          children: List.generate(
              posts.data.tags.length,
              (i) => MyFeaturedNewsWidget(
                    slug: posts.data.tags[i].slug,
                    image: posts.data.tags[i].featuredImage,
                    title: posts.data.tags[i].title,
                    date: posts.data.tags[i].createdAt.toString(),
                    description: posts.data.tags[i].summary,
                    view: 290,
                  )),
        ));
        return Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: PageView(
                  scrollDirection: Axis.vertical,
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (i) {
                    state(() {
                      _currentPage = 0;
                    });
                  },
                  children: widgets),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicatorStatic(_numPages),
            ),
          ),
        ]);
      },
    );
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
    return Scaffold(
      drawer: MyDrawerWidget(),
      body: StreamBuilder<ApiResponse<HomePost>>(
        stream: _bloc.homePostStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (!snapshot.data.isConsumed) {
              snapshot.data.isConsumed = true;
              switch (snapshot.data?.apiStatus) {
                case Status.LOADING:
                  return Center(child: buildLoader);
                  break;
                case Status.COMPLETED:
                  return buildNews(snapshot.data.data);
                  break;
                case Status.ERROR:
                  Fluttertoast.showToast(msg: snapshot.data.message);
                  return PageNotFoundScreen();
                  break;
              }
            }
          }
          return Center(child: buildLoader);
        },
      ),
    );
  }
}
