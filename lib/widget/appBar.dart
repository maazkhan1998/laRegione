import 'package:flutter/material.dart';
import 'package:laregione/screen/notificationScreen.dart';

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
            icon: Icon(Icons.notifications_on_outlined, size: 30),
            onPressed: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>NotificationDialog())
            ),
            color: themeData.colorScheme.primary,
          )
        ],
      );
}