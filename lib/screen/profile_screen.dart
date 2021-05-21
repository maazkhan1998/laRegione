import 'package:flutter/material.dart';
import 'package:laregione/widget/custom_drawer.dart';
import '../utils/AppTheme.dart';
import 'subscription_screen.dart';
import 'password_screen.dart';
import 'edit_profile_screen.dart';
import '../utils/Generator.dart';
import '../utils/SizeConfig.dart';
import '../widget/appBar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  GlobalKey<ScaffoldState> key = GlobalKey();

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              key: key,
              drawer: MyDrawerWidget(),
              appBar: customAppBar(context, key),
              backgroundColor: Colors.white,
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
                                image:
                                    AssetImage("./assets/images/avatar-3.jpg"),
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
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size4))),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SubscriptionScreen())),
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
                            navigation: PasswordScreen()),
                        Divider(),
                        singleOption(
                            option: "Subscriptions",
                            navigation: SubscriptionScreen()),
                        Divider(),
                        singleOption(
                            option: "Notification", navigation: Container()),
                        Divider(),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  Widget singleOption({@required String option, Widget navigation}) {
    bool switchValue = false;
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
            option == 'Notification'
                ? StatefulBuilder(
                    builder: (_, state) => Switch(
                      activeColor: Colors.green[400],
                      value: switchValue,
                      onChanged: (val) =>
                          state(() => switchValue = !switchValue),
                    ),
                  )
                : Container(
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
