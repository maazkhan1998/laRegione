import 'package:flutter/material.dart';
import 'package:laregione/AppTheme.dart';
import 'package:laregione/screen/Login1Screen.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppThemeNotifier.dart';


class ShoppingRegisterScreen extends StatefulWidget {
  @override
  _ShoppingRegisterScreenState createState() => _ShoppingRegisterScreenState();
}

class _ShoppingRegisterScreenState extends State<ShoppingRegisterScreen> {
   ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
              padding: EdgeInsets.only(top: MySize.size48),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: MySize.size16, right: MySize.size16),
                              child: Center(
                                child: Text(
                                  "Create an Account",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      fontWeight: 600),
                                ),
                              )),
                          Container(
                            margin:
                                EdgeInsets.only(left: MySize.size48, right: MySize.size48, top: MySize.size40),
                            child: Text(
                              "Enter your details to create new your account",
                              softWrap: true,
                              style: AppTheme.getTextStyle(
                                  themeData.appBarTheme.textTheme.bodyText1,
                                  fontWeight: 600,
                                  height: 1.2,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(200)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: MySize.size24, right: MySize.size24, top: MySize.size36),
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: themeData.cardTheme.color,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size16)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8.0,
                                        color: themeData.cardTheme.shadowColor
                                            .withAlpha(25),
                                        offset: Offset(0, 3)),
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600,
                                          letterSpacing: 0,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180)),
                                      hintText: "Username",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(16),
                                    ),
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                  Divider(
                                    color: themeData.dividerColor,
                                    height: 0.5,
                                  ),
                                  TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600,
                                          letterSpacing: 0,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180)),
                                      hintText: "Email Address",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(16),
                                    ),
                                    autofocus: false,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  Divider(
                                    color: themeData.dividerColor,
                                    height: 0.5,
                                  ),
                                  TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600,
                                          letterSpacing: 0,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180)),
                                      hintText: "Your Password",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(MySize.size16),
                                    ),
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: true,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin:
                                  EdgeInsets.only(left: MySize.size24, right: MySize.size24, top: MySize.size36),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size48)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          themeData.primaryColor.withAlpha(100),
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                  ),
                                  onPressed: () {
                                    
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none, alignment: Alignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CONTINUE",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              letterSpacing: 0.8,
                                              fontWeight: 700),
                                        ),
                                      ),
                                      Positioned(
                                        right: 16,
                                        child: ClipOval(
                                          child: Container(
                                            color: themeData
                                                .colorScheme.primaryVariant,
                                            // button color
                                            child: SizedBox(
                                                width: MySize.size30,
                                                height: MySize.size30,
                                                child: Icon(
                                                  MdiIcons.arrowRight,
                                                  color: themeData
                                                      .colorScheme.onPrimary,
                                                  size: MySize.size18,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Login1Screen()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Center(
                                child: Text(
                                  "I have already an account",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
      },
    );
  }
}
