import 'package:flutter/material.dart';

class MyFeaturedNewsWidget extends StatelessWidget {
  final String image, date, title, description;
  final int view;

  const MyFeaturedNewsWidget(
      {Key key,
        @required this.image,
        @required this.date,
        @required this.title,
        @required this.description,
        @required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/post');
      },
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, bottom: 16),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: "article-tag",
                  child: Image(
                    image: AssetImage(image),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(date,
                          // style: AppTheme.getTextStyle(
                          //     themeData.textTheme.bodyText2,
                          //     fontWeight: 700)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Text(title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
                            // style: AppTheme.getTextStyle(
                            //     themeData.textTheme.headline6,
                            //     fontWeight: 700)
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text(description,
                            // style: AppTheme.getTextStyle(
                            //     themeData.textTheme.bodyText2,
                            //     fontWeight: 500,
                            //     height: 1.2)
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 8),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: <Widget>[
                        //       Container(
                        //           margin: EdgeInsets.only(left: 16),
                        //           child: Icon(
                        //             Icons.comment,
                        //            // color: themeData.colorScheme.onBackground.withAlpha(200),
                        //             size: 20,
                        //           )),
                        //       Container(
                        //         margin: EdgeInsets.only(left: 4),
                        //         child: Text(view.toString(),
                        //             // style: AppTheme.getTextStyle(
                        //             //     themeData.textTheme.caption,
                        //             //     fontWeight: 700)
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Center(
                        //     child: ElevatedButton(
                        //
                        //         onPressed: () {},
                        //         child: Text(
                        //           "READ MORE",
                        //           style: AppTheme.getTextStyle(
                        //               themeData.textTheme.bodyText2,
                        //               fontWeight: 700,
                        //               color: themeData.colorScheme.onPrimary),
                        //         )),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}