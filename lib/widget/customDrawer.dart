import 'package:flutter/material.dart';
import '../screen/about_app_screen.dart';
import '../screen/setting_screen.dart';
import '../screen/ChatHomeScreen.dart';
import '../screen/FAQ_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/SocialSearchScreen.dart';
import '../screen/bookMarkScreen.dart';
import '../utils/SizeConfig.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Scrollbar(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MySize.size60),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ProfileScreen())),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar-1.jpg'),
                        radius: 40,
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        'John Doe',
                        style: TextStyle(
                            color: themeData.colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MySize.size40),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BookMarkScreen(
                            withAppBar: false,
                          ))),
                  child: Text('Latest 24h News',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BookMarkScreen(
                            withAppBar: false,
                          ))),
                  child: Text('Top News',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BookMarkScreen(
                            withAppBar: false,
                          ))),
                  child: Text('Travel',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SocialSearchScreen())),
                  child: Text('Authors',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: MySize.size10),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: MySize.size10),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FAQScreen())),
                  child: Text('FAQ',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AppScreen())),
                  child: Text('About',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ChatHomeScreen())),
                  child: Text('Contact',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AppScreen())),
                  child: Text('Privacy',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: MySize.size10),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: MySize.size10),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SettingScreen())),
                  child: Text('Settings',
                      style: TextStyle(
                          color: themeData.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
                Text('Logout',
                    style: TextStyle(
                        color: themeData.colorScheme.primary,
                        fontSize: 22,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
