import 'package:flutter/material.dart';
import '../screen/topics/topic_posts_screen.dart';
import '../models/user.dart';
import '../screen/profile/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
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
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => TopicPostsScreen(
                        headerImage: 'assets/topics/technology.jpg',
                        topicName: "Top News",
                      ))),
            ),
            ListTile(
                title: Text('Latest 24 hours'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => TopicPostsScreen(
                          headerImage: 'assets/topics/technology.jpg',
                          topicName: "Latest 24 hours",
                        )))),
            ListTile(
              title: Text('Travel'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => TopicPostsScreen(
                        headerImage: 'assets/topics/technology.jpg',
                        topicName: "Travel",
                      ))),
            ),
            ListTile(
              title: Text('Publisher'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => TopicPostsScreen(
                        headerImage: 'assets/topics/technology.jpg',
                        topicName: "Publisher",
                      ))),
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
