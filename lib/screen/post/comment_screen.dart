import 'package:flutter/material.dart';
import '../../widget/custom_list_tile.dart';
import '../../utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/app_theme.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppTheme.defaultTheme.backgroundColor,
        title: Text('Comments'),
        centerTitle: true,
      ),
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
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomListTile(
                          image: 'assets/images/avatar-1.jpg',
                          comment:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                          time: '2 hours ago',
                        ),
                      )),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
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
                        shape: BoxShape.circle, color: Colors.white),
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
    );
  }
}
