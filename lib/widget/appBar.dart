import 'package:flutter/material.dart';

customAppBar(BuildContext context,GlobalKey<ScaffoldState> scaffoldKey){
  ThemeData themeData;

  themeData = Theme.of(context);

  return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:
              Icon(Icons.menu, color: themeData.colorScheme.primary, size: 30),
          onPressed: () => scaffoldKey.currentState.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined, size: 30),
            onPressed: () {},
            color: themeData.colorScheme.primary,
          ),
          IconButton(
            icon: Icon(Icons.notifications_on_outlined, size: 30),
            onPressed: () {},
            color: themeData.colorScheme.primary,
          )
        ],
      );
}