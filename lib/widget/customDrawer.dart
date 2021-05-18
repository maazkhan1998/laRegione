import 'package:flutter/material.dart';
import 'package:laregione/screen/SocialSearchScreen.dart';
import 'package:laregione/utils/SizeConfig.dart';

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
                    padding: EdgeInsets.symmetric(horizontal:20),
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Scrollbar(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height:MySize.size60),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/avatar-1.jpg'),
                          radius: 40,
                        ),
                        SizedBox(width:MySize.size10),
                        Text('John Doe',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 18,fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                    SizedBox(height:MySize.size40),
                    Text('Latest 24h News',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                        Text('Top News',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                        Text('Travel',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                        GestureDetector(
                          onTap: ()=>Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_)=>SocialSearchScreen()
                            )
                          ),
                                                  child: Text('Authors',style: TextStyle(
                            color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                          )),
                        ),
                    SizedBox(height:MySize.size10),
                    Divider(
                      color: Colors.black,
                    ),SizedBox(height:MySize.size10),
                    Text('FAQ',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                    Text('About',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                    Text('Contact',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                    Text('Privacy',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                    SizedBox(height:MySize.size10),
                    Divider(
                      color: Colors.black,
                    ),SizedBox(height:MySize.size10),
                    Text('Settings',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        )),
                    Text('Logout',style: TextStyle(
                          color: themeData.colorScheme.primary,fontSize: 22,fontWeight: FontWeight.w500
                        ))
                  ],
                ),
            ),
          ),
        ),
      );
  }
}