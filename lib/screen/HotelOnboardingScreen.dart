/*
* File : Hotel Onboarding
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laregione/AppTheme.dart';
import 'package:laregione/AppThemeNotifier.dart';
import 'package:laregione/screen/Login1Screen.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:laregione/utils/custom/onBoarding/CustomOnBoardingWidget.dart';
import 'package:laregione/utils/custom/onBoarding/UI/pages.dart';
import 'package:provider/provider.dart';

class HotelOnboardingScreen extends StatefulWidget {
  @override
  _HotelOnboardingScreenState createState() => _HotelOnboardingScreenState();
}

class _HotelOnboardingScreenState extends State<HotelOnboardingScreen> {
   ThemeData themeData;

  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: themeData.backgroundColor,
                  child: CustomOnBoardingWidget(
                    pages: <PageViewModel>[
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/hotel/illu-1.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: 30.0),
                              Text('Book a Hotel\nfrom Anywhere',
                                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,fontWeight: 600)),
                              SizedBox(height: 15.0),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: themeData.textTheme.bodyText2.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(200),
                                      letterSpacing: 0.1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/hotel/illu-2.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30.0),
                              Text(
                                'Hotel Facility\nGames',
                                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,fontWeight: 600),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: themeData.textTheme.bodyText2.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/hotel/illu-3.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: MySize.size30),
                              Text('Hotel Facility\nPool',
                                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,fontWeight: 600)),
                              SizedBox(height: 15.0),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: themeData.textTheme.bodyText2.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor: themeData.colorScheme.secondary,
                    selectedIndicatorColor: themeData.colorScheme.primary,
                    doneWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login1Screen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text("DONE".toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 700)),
                        ),
                      ),
                    ),
                    skipWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login1Screen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text("Skip".toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  color: themeData.colorScheme.secondary,
                                  fontWeight: 700)),
                        ),
                      ),
                    ),
                  ))));
    });
  }
}
