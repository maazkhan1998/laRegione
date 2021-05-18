import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:laregione/widget/appBar.dart';
import 'package:laregione/widget/customDrawer.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'bookMarkScreen.dart';

class SocialSearchScreen extends StatefulWidget {
  @override
  _SocialSearchScreenState createState() => _SocialSearchScreenState();
}

class _SocialSearchScreenState extends State<SocialSearchScreen> {
   ThemeData themeData;
   CustomAppTheme customAppTheme;
   GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();

   List<bool> _list;

  @override
  void initState() {
    super.initState();
    _list = List.generate(6, (index) => false);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return Scaffold(
          key: scaffoldKey,
              appBar: customAppBar(context,scaffoldKey),
              drawer: CustomDrawer(),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.top(48),
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 0, 24, 0),
                        child: Column(
                          children: [
                            searchResultItem(
                                index: 4,
                                image: './assets/images/avatar-5.jpg',
                                name: 'Lowri Gould',
                                status: "@lowri12"),
                            searchResultItem(
                                index: 5,
                                image: './assets/images/avatar.jpg',
                                name: 'Samson Bains',
                                isActive: true,
                                status: "@samson_bains"),
                            searchResultItem(
                                index: 0,
                                image: './assets/images/avatar-2.jpg',
                                isActive: true,
                                name: 'Reanne Dudley',
                                status: "@reanne45"),
                            searchResultItem(
                                index: 1,
                                image: './assets/images/avatar-1.jpg',
                                name: 'Calista Garcia',
                                status: "@calista"),
                            searchResultItem(
                                index: 2,
                                image: './assets/images/avatar-3.jpg',
                                name: 'Samson Bains',
                                status: "@samson_56"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
      },
    );
  }

  Widget searchResultItem(
      {@required String image,
      @required int index,
      @required String name,
      @required String status,
      bool isActive = false}) {
    return Container(
        margin: Spacing.top(16),
        child: InkWell(
    onTap: ()=> Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_)=>BookMarkScreen(withAppBar: true,)
        )
      ),
    child: Row(
      children: <Widget>[
        Stack(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(MySize.size24)),
              child: Image(
                image: AssetImage(image),
                height: MySize.size44,
                width: MySize.size44,
                fit: BoxFit.cover,
              ),
            ),
            isActive
                ? Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: customAppTheme.bgLayer1, width: 2),
                          shape: BoxShape.circle),
                      child: Container(
                        width: MySize.size8,
                        height: MySize.size8,
                        decoration: BoxDecoration(
                            color: customAppTheme.colorSuccess,
                            shape: BoxShape.circle),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
        Expanded(
          child: Container(
            margin: Spacing.left(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Text(
                  status,
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontSize: 12,
                      color:
                          themeData.colorScheme.onBackground.withAlpha(160),
                      fontWeight: 600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _list[index] = !_list[index];
            });
          },
          child: Container(
            padding: Spacing.fromLTRB(16, 8, 16, 8),
            decoration: _list[index]
                ? BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size6)),
                    border: Border.all(
                        color: customAppTheme.bgLayer4, width: 1))
                : BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size6)),
                    color: themeData.colorScheme.primary),
            child: Text(
              _list[index] ? "Following" :"Follow" ,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: _list[index]
                      ? themeData.colorScheme.onBackground
                      : themeData.colorScheme.onPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.3),
            ),
          ),
        )
      ],
    ),
        ),
      );
  }
}
