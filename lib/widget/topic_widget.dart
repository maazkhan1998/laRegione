import 'package:flutter/material.dart';

class TopicsWidget extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String description;
  final GestureTapCallback onTap;

  const TopicsWidget(
      {Key key,
      @required this.id,
      @required this.image,
      @required this.title,
      @required this.description,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Hero(
                        tag: 'topic-tag-$id',
                        child: Image(
                            image: AssetImage(image),
                            height: 150,
                            fit: BoxFit.fitWidth))),
                ListTile(
                  title: Text(title),
                  subtitle: Text(description),
                  trailing: Icon(Icons.favorite_border),
                ),
              ],
            ),
          )),
    );
  }
}
