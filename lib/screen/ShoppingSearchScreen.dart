import 'package:flutter/material.dart';
import 'package:laregione/AppThemeNotifier.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:laregione/widget/productListWidget.dart';
import 'package:provider/provider.dart';

class ShoppingSearchScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingSearchScreen({ @required this.rootContext});

  @override
  _ShoppingSearchScreenState createState() => _ShoppingSearchScreenState();
}

class _ShoppingSearchScreenState extends State<ShoppingSearchScreen>
    with
        SingleTickerProviderStateMixin
         {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   ThemeData themeData;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) + 72);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return 
            SafeArea(
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  key: _scaffoldKey,
                  backgroundColor: themeData.backgroundColor,
                  body: ListView(
                    padding: EdgeInsets.all(0),
                    children: <Widget>[
                      Container(
                        child: GridView.count(
                            padding: EdgeInsets.all(MySize.size16),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: findAspectRatio(
                                MediaQuery.of(context).size.width*2),
                            mainAxisSpacing: MySize.size16,
                            crossAxisSpacing: MySize.size16,
                            children: <Widget>[
                              ProductListWidget(
                                name: "Yellow cake",
                                image:
                                    './assets/images/shopping/product/product-1.jpg',
                                rootContext: widget.rootContext,
                              ),
                              ProductListWidget(
                                name: "Cosmic bang",
                                image:
                                    './assets/images/shopping/product/product-7.jpg',
                                rootContext: widget.rootContext,
                              ),
                              ProductListWidget(
                                name: "Sweet Gems",
                                image:
                                    './assets/images/shopping/product/product-5.jpg',
                                rootContext: widget.rootContext,
                              ),
                            ]),
                      ),
                    ],
                  )),
            );
      },
    );
  }
         }