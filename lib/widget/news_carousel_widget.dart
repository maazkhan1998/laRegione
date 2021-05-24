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

  initState(){
    _bloc=HomeBloc();
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

  buildNews(HomePost posts){
    _numPages=posts.data.articles.length;
   return StatefulBuilder(
        builder:(context,state)=> Column(
                  children:[ Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (i){
                      if(i==0)_numPages=posts.data.articles.length;
                      if(i==1)_numPages=posts.data.topics.eaque.length;
                      if(i==2)_numPages=posts.data.topics.nihil.length;
                      if(i==3)_numPages=posts.data.topics.velit.length;
                      if(i==4)_numPages=posts.data.topics.officiis.length;
                      if(i==5)_numPages=posts.data.topics.id.length;
                      if(i==6)_numPages=posts.data.topics.qui.length;
                      if(i==7)_numPages=posts.data.topics.eum.length;
                      if(i==8)_numPages=posts.data.topics.eius.length;
                      if(i==9)_numPages=posts.data.topics.ut.length;
                      if(i==10)_numPages=posts.data.topics.eos.length;
                      if(i==11)_numPages=posts.data.publishers.rubieJenkins.length;
                      if(i==12)_numPages=posts.data.publishers.moseRenner.length;
                      if(i==13)_numPages=posts.data.publishers.fidelCorkery.length;
                      if(i==14)if(i==11)_numPages=posts.data.tags.length;
                      state(()=>_currentPage=0);
                    },
                    children: <Widget>[
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.articles.length,(i)
                        => MyFeaturedNewsWidget(
                          slug:posts.data.articles[i].slug ,
                            image: posts.data.articles[i].featuredImage,
                            title: posts.data.articles[i].title,
                            date: posts.data.articles[i].publisher.created.toString(),
                            description: posts.data.articles[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.eaque.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.eaque[i].slug,
                            image: posts.data.topics.eaque[i].featuredImage,
                            title: posts.data.topics.eaque[i].title,
                            date: posts.data.topics.eaque[i].publisher.created.toString(),
                            description: posts.data.topics.eaque[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.nihil.length,(i)
                        => MyFeaturedNewsWidget(
                          slug:posts.data.topics.nihil[i].slug,
                            image: posts.data.topics.nihil[i].featuredImage,
                            title: posts.data.topics.nihil[i].title,
                            date: posts.data.topics.nihil[i].publisher.created.toString(),
                            description: posts.data.topics.nihil[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.velit.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.velit[i].slug,
                            image: posts.data.topics.velit[i].featuredImage,
                            title: posts.data.topics.velit[i].title,
                            date: posts.data.topics.velit[i].publisher.created.toString(),
                            description: posts.data.topics.velit[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.officiis.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.officiis[i].slug,
                            image: posts.data.topics.officiis[i].featuredImage,
                            title: posts.data.topics.officiis[i].title,
                            date: posts.data.topics.officiis[i].publisher.created.toString(),
                            description: posts.data.topics.officiis[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.id.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.id[i].slug,
                            image: posts.data.topics.id[i].featuredImage,
                            title: posts.data.topics.id[i].title,
                            date: posts.data.topics.id[i].publisher.created.toString(),
                            description: posts.data.topics.id[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.qui.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.qui[i].slug,
                            image: posts.data.topics.qui[i].featuredImage,
                            title: posts.data.topics.qui[i].title,
                            date: posts.data.topics.qui[i].publisher.created.toString(),
                            description: posts.data.topics.qui[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.eum.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.eum[i].slug,
                            image: posts.data.topics.eum[i].featuredImage,
                            title: posts.data.topics.eum[i].title,
                            date: posts.data.topics.eum[i].publisher.created.toString(),
                            description: posts.data.topics.eum[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.eius.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.eius[i].slug,
                            image: posts.data.topics.eius[i].featuredImage,
                            title: posts.data.topics.eius[i].title,
                            date: posts.data.topics.eius[i].publisher.created.toString(),
                            description: posts.data.topics.eius[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.ut.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.ut[i].slug,
                            image: posts.data.topics.ut[i].featuredImage,
                            title: posts.data.topics.ut[i].title,
                            date: posts.data.topics.ut[i].publisher.created.toString(),
                            description: posts.data.topics.ut[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.topics.eos.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.topics.eos[i].slug,
                            image: posts.data.topics.eos[i].featuredImage,
                            title: posts.data.topics.eos[i].title,
                            date: posts.data.topics.eos[i].publisher.created.toString(),
                            description: posts.data.topics.eos[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.publishers.rubieJenkins.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.publishers.rubieJenkins[i].slug,
                            image: posts.data.publishers.rubieJenkins[i].featuredImage,
                            title: posts.data.publishers.rubieJenkins[i].title,
                            date: posts.data.publishers.rubieJenkins[i].createdAt.toString(),
                            description: posts.data.publishers.rubieJenkins[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.publishers.moseRenner.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.publishers.moseRenner[i].slug,
                            image: posts.data.publishers.moseRenner[i].featuredImage,
                            title: posts.data.publishers.moseRenner[i].title,
                            date: posts.data.publishers.moseRenner[i].createdAt.toString(),
                            description: posts.data.publishers.moseRenner[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.publishers.fidelCorkery.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.publishers.fidelCorkery[i].slug,
                            image: posts.data.publishers.fidelCorkery[i].featuredImage,
                            title: posts.data.publishers.fidelCorkery[i].title,
                            date: posts.data.publishers.fidelCorkery[i].createdAt.toString(),
                            description: posts.data.publishers.fidelCorkery[i].summary,
                            view: 290,
                          )),
                      ),
                      PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (int page) {
                          state(() {
                            _currentPage = page;
                          });
                        },
                        children:List.generate(posts.data.tags.length,(i)
                        => MyFeaturedNewsWidget(
                          slug: posts.data.tags[i].slug,
                            image: posts.data.tags[i].featuredImage,
                            title: posts.data.tags[i].title,
                            date: posts.data.tags[i].createdAt.toString(),
                            description: posts.data.tags[i].summary,
                            view: 290,
                          )),
                      )
                    ],
                  ),
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
                  ]
        ),
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
      body: 
          StreamBuilder<ApiResponse<HomePost>>(
            stream: _bloc.homePostStream,
            builder: (context,snapshot){
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
                                Fluttertoast.showToast(
                                    msg: snapshot.data.message);
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
