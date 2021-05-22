import 'package:flutter/material.dart';
import 'package:laregione/models/user.dart';
import 'package:laregione/screen/profile_screen.dart';
import '../screen/bookMarkScreen.dart';

class MyDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/logo-dark.png",
                  )),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              title: Text('Top News'),
              onTap: () {},
            ),
            ListTile(
                title: Text('Latest 24 hours'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BookMarkScreen(
                          withAppBar: false,
                        )))),
            ListTile(
              title: Text('Travel'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BookMarkScreen(
                        withAppBar: false,
                      ))),
            ),
            ListTile(
              title: Text('Publisher'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/publisher');
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                        user: User(
                            email: 'test@test.com',
                            password: 'yebshdbf32',
                            userImage: './assets/images/avatar-3.jpg',
                            userName: 'Patrick Hey'),
                      ))),
            ),
            ListTile(
              title: Text('Info'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/info');
              },
            ),
          ],
        ),
      ),
    );
  }
}
