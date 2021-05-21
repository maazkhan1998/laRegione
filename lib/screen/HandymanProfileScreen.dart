import 'package:flutter/material.dart';
import 'package:laregione/AppTheme.dart';
import 'package:laregione/AppThemeNotifier.dart';
import 'package:laregione/screen/HandymanSubscriptionScreen.dart';
import 'package:laregione/screen/ResetPasswordScreen.dart';
import 'package:laregione/screen/ShoppingAddCardScreen.dart';
import 'package:laregione/screen/editProfileScreen.dart';
import 'package:laregione/utils/Generator.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:laregione/widget/appBar.dart';
import 'package:laregione/widget/customDrawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'favoriteScreen.dart';


class HandymanProfileScreen extends StatefulWidget {
  @override
  _HandymanProfileScreenState createState() => _HandymanProfileScreenState();
}

class _HandymanProfileScreenState extends State<HandymanProfileScreen> {
   ThemeData themeData;
   CustomAppTheme customAppTheme;
   GlobalKey<ScaffoldState> key=GlobalKey();

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder:
          (BuildContext buildContext, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                key: key,
                drawer: CustomDrawer(),
                appBar: customAppBar(context, key),
                  backgroundColor: customAppTheme.bgLayer1,
                  body: ListView(
                    padding: EdgeInsets.all(MySize.size24),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MySize.size80,
                              height: MySize.size80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "./assets/images/avatar-3.jpg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8),
                              child: Text("Derrick Malone",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      letterSpacing: 0)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        padding: EdgeInsets.only(
                            left: MySize.size16,
                            top: MySize.size8,
                            bottom: MySize.size8,
                            right: MySize.size16),
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size4))),
                        child: InkWell(
                          onTap: ()=>Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_)=>HandymanSubscriptionScreen()
                            )
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(MdiIcons.informationOutline,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size18),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16),
                                child: Text(
                                  "Premium member",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: Generator.goldColor,
                                      fontWeight: 600,
                                      letterSpacing: 0.2),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Upgrade",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        child: Column(
                          children: <Widget>[
                            singleOption(
                                option: "Edit Profile",
                                navigation: EditProfileScreen()),
                            Divider(),
                            singleOption(
                                option: "Change password",
                                navigation: ResetPasswordScreen()),
                            Divider(),
                            singleOption(
                                option: "Subscriptions",
                                navigation: HandymanSubscriptionScreen()),
                            Divider(),
                            singleOption(
                                option: "Notification",
                                navigation: Container()),
                            Divider(),
                          ],
                        ),
                      )
                    ],
                  )),
            ));
      },
    );
  }

  Widget singleOption({ @required String option, Widget navigation}) {
    bool switchValue=false;
    return Container(
      padding: EdgeInsets.symmetric(vertical: MySize.size8, horizontal: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: MySize.size16),
                child: Text(option,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600)),
              ),
            ),
            option=='Notification'?StatefulBuilder(
                          builder:(_,state)=> Switch(
                            activeColor: Colors.green[400],
                value: switchValue,
                onChanged: (val)=>state(()=>switchValue=!switchValue),
              ),
            ):
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: MySize.size22,
                  color: themeData.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
