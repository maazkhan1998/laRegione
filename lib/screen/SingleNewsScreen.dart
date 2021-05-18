import 'package:flutter/material.dart';
import 'package:laregione/AppTheme.dart';
import 'package:laregione/utils/Generator.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../AppThemeNotifier.dart';

class SingleNewsScreen extends StatefulWidget {
  @override
  _SingleNewsScreenState createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
   ThemeData themeData;
   CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return  Padding(
                  padding: Spacing.fromLTRB(24, 40, 24, 40),
                                child: Column(
                      children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                borderRadius: BorderRadius.all(
                  Radius.circular(MySize.size24)),
                                boxShadow: [
                                  BoxShadow(
                    color:
                        customAppTheme.shadowColor.withAlpha(120),
                    blurRadius: MySize.size24,
                    spreadRadius: MySize.size4)
                                ]),
                            child: Column(
                              children: [
                                ClipRRect(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.all(
                    Radius.circular(MySize.size24)),
                                  child: Image(
                  image: AssetImage(
                      './assets/images/all/all-l2.jpg'),
                                  ),
                                ),
                                Container(
                                  padding: Spacing.all(16),
                                  child: Column(
                  children: [
                    Container(
                      child: Text(
                        "14 Passengers Banned By Nona Airlines After bad Behaviour",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          color: themeData
                              .colorScheme.onBackground,
                          fontWeight: 600),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        
                      },
                      child: Container(
                        margin: Spacing.top(16),
                        child: Row(
                        children: [
                          ClipRRect(
                            clipBehavior:
                                Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size14)),
                            child: Image(
                              image: AssetImage(
                                  './assets/images/avatar-2.jpg'),
                              height: MySize.size28,
                              width: MySize.size28,
                            ),
                          ),
                          SizedBox(
                            width: MySize.size16,
                          ),
                          Text(
                            "John smith",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData
                  .colorScheme.onBackground,
                                fontWeight: 600,
                                xMuted: true),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "10 Jan, 2020",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData
                  .colorScheme.onBackground,
                                fontWeight: 500,
                                xMuted: true),
                          ),
                        ],
                        ),
                      ),
                    )
                  ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.top(24),
                            child: Text(Generator.getParagraphsText(
                                paragraph: 4,
                                words: 30,
                                noOfNewLine: 2,
                                withHyphen: false)),
                          ),
                          
                      ],
                  ),
                );
      },
    );
  }
}
