import 'package:flutter/material.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../AppTheme.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
   ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.backgroundColor,
          elevation: 0,
          title: Text("Notifications",
              style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                  fontWeight: 600)),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: MySize.size16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: MySize.size24,
                  color: themeData.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: Container(
            color: themeData.backgroundColor,
            padding: EdgeInsets.all(MySize.size16),
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                singleNotification(
                    iconData: MdiIcons.food,
                    time: "Just Now ",
                    text: "Your order placed successfully"),
                singleNotification(
                    iconData: MdiIcons.close,
                    time: "1 Day ago",
                    text: "Your last order cancel due to payment issue"),
                singleNotification(
                    iconData: MdiIcons.check,
                    time: "3 Day ago",
                    text: "Burger order successfully deliver"),
                singleNotification(
                    iconData: MdiIcons.emailOutline,
                    time: "1 Month ago",
                    text: "A new email from restaurant"),
                Container(
                  margin: EdgeInsets.only(top: MySize.size8),
                  child: Center(
                    child: Text(
                      "View all",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.primary,
                          fontWeight: 500),
                    ),
                  ),
                )
              ],
            )));
  }

  Widget singleNotification({IconData iconData, @required String text, @required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: MySize.size16),
      padding: EdgeInsets.only(
          left: MySize.size16,
          right: MySize.size16,
          top: MySize.size8,
          bottom: MySize.size8),
      decoration: BoxDecoration(color: themeData.backgroundColor, boxShadow: [
        BoxShadow(
            color: themeData.cardTheme.shadowColor.withAlpha(12),
            blurRadius: MySize.size8,
            offset: Offset(0, MySize.size4))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(MySize.size12),
            child: Icon(
              iconData,
              color: themeData.colorScheme.onPrimary,
              size: MySize.size22,
            ),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
          ),
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: MySize.size18, right: MySize.size18),
                child: Text(text)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: themeData.colorScheme.onBackground,
                    fontSize: 12,
                    muted: true,
                    fontWeight: 500,
                    letterSpacing: -0.2),
              ),
            ],
          )
        ],
      ),
    );
  }
}