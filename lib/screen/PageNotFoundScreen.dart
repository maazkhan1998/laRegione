import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class PageNotFoundScreen extends StatefulWidget {
  @override
  _PageNotFoundScreenState createState() => _PageNotFoundScreenState();
}

class _PageNotFoundScreenState extends State<PageNotFoundScreen> {

  Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                  backgroundColor:Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                ),
                backgroundColor: Colors.white,
                body: Container(
                  child: Center(
                    child:  Image(
                      image: AssetImage('./assets/illustration/shopping/page-not-found.png'),
                    ),
                  )
                ));
      
  }
}
