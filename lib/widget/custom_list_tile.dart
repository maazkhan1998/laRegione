import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class CustomListTile extends StatefulWidget {
  final String image;
  final String comment;
  final String time;

  CustomListTile(
      {@required this.image, @required this.comment, @required this.time});
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(widget.image),
          ),
          SizedBox(width: MySize.size20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.comment,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: Colors.black, fontSize: 16, height: 1.4),
                ),
                SizedBox(height: MySize.size5),
                Text(
                  widget.time,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
