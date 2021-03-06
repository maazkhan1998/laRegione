import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../utils/size_config.dart';
import '../../widget/fulll_image_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/app_theme.dart';
import 'contact_message_screen.dart';

class ContactUsScreen extends StatefulWidget {
  static const String routeName = '/info/contact';
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: Container(
              color: Colors.white,
              child: ListView(
                padding: Spacing.zero,
                children: <Widget>[
                  Container(
                    padding: Spacing.all(24),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8))),
                          padding: Spacing.all(6),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: "Search messages",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8),
                                          ),
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8),
                                          ),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8),
                                          ),
                                          borderSide: BorderSide.none),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(MySize.size4),
                                decoration: BoxDecoration(
                                    color: AppTheme.defaultTheme.primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size8))),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size8),
                                  child: Icon(
                                    MdiIcons.magnify,
                                    color:
                                        AppTheme.defaultTheme.backgroundColor,
                                    size: MySize.size20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: singleChat(
                            image: './assets/images/avatar-1.jpg',
                            time: "12:34 AM",
                            name: "Alice Henry",
                          ),
                        ),
                        Container(
                            margin: Spacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/avatar-4.jpg',
                            time: "8:12 PM",
                            name: "Jevon Shah"),
                        Container(
                            margin: Spacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/avatar-3.jpg',
                            time: "5:30 AM",
                            name: "Susie Salter"),
                        Container(
                            margin: Spacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                          image: './assets/images/avatar-2.jpg',
                          time: "1:24 PM",
                          name: "Kaylen Lamb",
                        ),
                        Container(
                            margin: Spacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                          image: './assets/images/avatar-5.jpg',
                          time: "7:10 AM",
                          name: "Joey Callaghan",
                        ),
                        Container(
                            margin: Spacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/avatar.jpg',
                            time: "7:10 AM",
                            name: "Joel Holman"),
                      ],
                    ),
                  )
                ],
              )),
        )));
  }

  void _showFullImage(String imagePath, String imageTag) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => FullImageScreen(
              imagePath: imagePath,
              imageTag: imageTag,
              backgroundOpacity: 200,
            )));
  }

  Widget singleChat({
    @required String image,
    @required String name,
    @required String time,
  }) {
    String tag = image + name;

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MailComposeScreen()));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size26)),
              child: InkWell(
                onTap: () {
                  _showFullImage(image, tag);
                },
                child: Hero(
                  tag: tag,
                  transitionOnUserGestures: true,
                  child: Image(
                    image: AssetImage(image),
                    height: MySize.size52,
                    width: MySize.size52,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          color: AppTheme.defaultTheme.primaryColorDark),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleOption(
      {IconData icon, @required String title, Widget navigation}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
      },
      child: Container(
        width: MySize.size120,
        decoration: BoxDecoration(
            color: AppTheme.defaultTheme.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8))),
        padding: Spacing.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size4)),
                  color: AppTheme.defaultTheme.primaryColor),
              padding: Spacing.all(2),
              child: Icon(
                icon,
                size: MySize.size18,
                color: AppTheme.defaultTheme.primaryColor,
              ),
            ),
            Container(
              margin: Spacing.top(8),
              child: Text(
                title,
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
