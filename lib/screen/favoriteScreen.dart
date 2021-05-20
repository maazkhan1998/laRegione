import 'package:flutter/material.dart';
import 'package:laregione/AppThemeNotifier.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:laregione/widget/productListWidget.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  final BuildContext rootContext;

  const FavoriteScreen({ @required this.rootContext});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
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
        return Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                backgroundColor: themeData.backgroundColor,
                body: SafeArea(
                                  child: ListView(
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
                                name: "Lipsticks",
                                image:
                                    './assets/images/shopping/product/product-3.jpg',
                               
                                rootContext: widget.rootContext,
                              ),
                              ProductListWidget(
                                name: "Colorful sandal",
                                image:
                                    './assets/images/shopping/product/product-8.jpg',
                            
                                rootContext: widget.rootContext,
                              ),
                              ProductListWidget(
                                name: "Toffees",
                                image:
                                    './assets/images/shopping/product/product-2.jpg',
                              
                                rootContext: widget.rootContext,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ));
      },
    );
  }
}


