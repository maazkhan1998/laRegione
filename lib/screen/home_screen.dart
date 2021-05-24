import 'package:flutter/material.dart';
import 'package:laregione/screen/search_screen.dart';
import '../widget/news_carousel_widget.dart';
import 'topic_screen.dart';
import 'favorite_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller;
  ThemeData themeData;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
       PersistentTabView(context,
          controller: _controller,
          screens: [
            NewsCarouselWidget(),
            TopicsScreen(
              rootContext: context,
            ),
            FavoriteScreen(
              rootContext: context,
            ),
            SearchScreen()
          ],
          items: [
            PersistentBottomNavBarItem(
                title: 'Home',
                icon: Icon(
                  Icons.home,
                ),
                activeColorPrimary: Colors.orange,
                inactiveColorPrimary: Colors.grey),
            PersistentBottomNavBarItem(
                title: 'Topics',
                icon: Icon(
                  Icons.apps,
                ),
                activeColorPrimary: Colors.orange,
                inactiveColorPrimary: Colors.grey),
            PersistentBottomNavBarItem(
                title: 'Favourites',
                icon: Icon(
                  Icons.favorite,
                ),
                activeColorPrimary: Colors.orange,
                inactiveColorPrimary: Colors.grey),
            PersistentBottomNavBarItem(
                title: 'Search',
                icon: Icon(
                  Icons.search,
                ),
                activeColorPrimary: Colors.orange,
                inactiveColorPrimary: Colors.grey),
          ],
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style11 // Choose the nav bar style with this property.
    );
  }
}
