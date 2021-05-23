import 'package:flutter/material.dart';
import 'package:laregione/models/post.dart';
import '../utils/AppTheme.dart';
import 'comment_screen.dart';
import '../utils/SizeConfig.dart';

class PostScreen extends StatefulWidget {
  static const String routeName = '/post';
  final Post post;

  const PostScreen({Key key, this.post}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return GestureDetector(
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
                      tag: "article-tag",
                      child: Image(
                        image: NetworkImage(widget.post.image),
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
                            widget.post.title,
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
                                    image: AssetImage(widget.post.authorPhoto),
                                    height: MySize.size28,
                                    width: MySize.size28,
                                  ),
                                ),
                                SizedBox(
                                  width: MySize.size16,
                                ),
                                Text(
                                  widget.post.authorName,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600,
                                      xMuted: true),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  widget.post.date,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
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
                child: Text(widget.post.text),
              ),
              // child: Text(Generator.getParagraphsText(
              //     paragraph: 4, words: 30, noOfNewLine: 2, withHyphen: false)),
            ),
          ],
        ),
      ),
    );
  }
}
