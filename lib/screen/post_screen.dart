import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/screen/PageNotFoundScreen.dart';
import 'package:laregione/screen/login_screen.dart';
import 'package:laregione/webServices/bloc/homeBloc.dart';
import 'package:laregione/webServices/models/singlePostModel.dart';
import '../utils/AppTheme.dart';
import 'comment_screen.dart';
import '../utils/SizeConfig.dart';

class PostScreen extends StatefulWidget {
  static const String routeName = '/post';

  final String slug;

  PostScreen(this.slug);
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  ThemeData themeData;

  HomeBloc _bloc;

  initState() {
    _bloc = HomeBloc();
    _bloc.fetchSinglePost(widget.slug);
    super.initState();
  }

  buildPost(SinglePost post) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CommentScreen())),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size24)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: MySize.size24,
                          spreadRadius: MySize.size4)
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Hero(
                        tag: post.data.featuredImage,
                        child: Image(
                          image: NetworkImage(post.data.featuredImage),
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: Spacing.all(16),
                      child: Column(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              post.data.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                            endIndent: 280,
                            thickness: 3,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: Spacing.top(16),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size14)),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/avatar-2.jpg'),
                                      height: MySize.size28,
                                      width: MySize.size28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MySize.size16,
                                  ),
                                  Text(
                                    post.data.publisher.name,
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600,
                                        xMuted: true),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    post.data.publishedDate,
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500,
                                        xMuted: true),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: Spacing.top(15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(post.data.body),
                ),
                // child: Text(Generator.getParagraphsText(
                //     paragraph: 4, words: 30, noOfNewLine: 2, withHyphen: false)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: StreamBuilder<ApiResponse<SinglePost>>(
        stream: _bloc.singlePostStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (!snapshot.data.isConsumed) {
              snapshot.data.isConsumed = true;
              switch (snapshot.data?.apiStatus) {
                case Status.LOADING:
                  return Center(child: buildLoader);
                  break;
                case Status.COMPLETED:
                  return buildPost(snapshot.data.data);
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
