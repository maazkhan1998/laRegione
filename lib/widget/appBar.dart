import 'package:flutter/material.dart';
import '../screen/notification_screen.dart';

customAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  ThemeData themeData;

  themeData = Theme.of(context);

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.menu, color: themeData.colorScheme.primary, size: 30),
      onPressed: () => scaffoldKey.currentState.openDrawer(),
    ),
  );
}
