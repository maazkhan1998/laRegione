import 'package:flutter/material.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Container(
          padding: Spacing.all(24),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, i) =>
                        SizedBox(height: MySize.size10),
                    itemCount: 4,
                    itemBuilder: (context, i) => CustomListTile(
                          image: 'assets/images/avatar-1.jpg',
                          comment:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                          time: '2 hours ago',
                        )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: customAppTheme.bgLayer1,
                    boxShadow: [
                      BoxShadow(
                          color: customAppTheme.shadowColor,
                          spreadRadius: 1,
                          blurRadius: MySize.size4,
                          offset: Offset(0, MySize.size2))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                padding: Spacing.fromLTRB(16, 4, 16, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Write a comment"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeData.colorScheme.primary.withAlpha(60)),
                      padding: Spacing.all(8),
                      child: Icon(
                        MdiIcons.sendOutline,
                        color: themeData.colorScheme.primary,
                        size: MySize.size20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  final String image;
  final String comment;
  final String time;

  CustomListTile(
      {@required this.image, @required this.comment, @required this.time});
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(widget.image),
          ),
          SizedBox(width: MySize.size10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.comment,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: Colors.black, fontSize: 16, height: 1.4),
                ),
                SizedBox(height: MySize.size5),
                Text(
                  widget.time,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
