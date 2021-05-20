import 'package:flutter/material.dart';
import 'package:laregione/screen/SingleNewsScreen.dart';
import 'package:laregione/utils/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../AppTheme.dart';

class ProductListWidget extends StatefulWidget {
  final String name, image;
  final BuildContext rootContext;

  const ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.rootContext})
      : super(key: key);

  @override
  ProductListWidgetState createState() => ProductListWidgetState();
}

class ProductListWidgetState extends State<ProductListWidget> {
   ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.rootContext,
            MaterialPageRoute(
                builder: (context) =>Scaffold(
                  body: SingleChildScrollView(
                    child:SingleNewsScreen(
                      widget.image
                    )
                  ),
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardTheme.color,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor.withAlpha(16),
              blurRadius: MySize.size8,
              spreadRadius: MySize.size4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        padding: EdgeInsets.all(MySize.size8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size8)),
                  child: Hero(
                    tag: widget.image,
                    transitionOnUserGestures: true,
                                      child: Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      MdiIcons.heartOutline,
                      color: themeData.colorScheme.onBackground.withAlpha(160),
                      size: 20,
                    ))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(widget.name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 700,
                          letterSpacing: 0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}