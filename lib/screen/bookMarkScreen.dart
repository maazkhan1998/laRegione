import 'package:flutter/material.dart';

import 'post_screen.dart';

class BookMarkScreen extends StatefulWidget {
  final bool withAppBar;

  BookMarkScreen({@required this.withAppBar});
  @override
  _BookMarkScreenState createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.withAppBar
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 30)),
              title: Text(
                'Author Name',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              actions: [
                IconButton(
                    onPressed: null,
                    icon: Icon(Icons.favorite, color: Colors.red, size: 30))
              ],
            )
          : null,
      body: ListView.builder(
        itemCount: 3,
        //itemBuilder: (context, i) => {}
        //PostScreen('./assets/images/all/all-l2.jpg'),
      ),
    );
  }
}
