import 'package:flutter/material.dart';
import 'package:laregione/screen/NewsCarouselWidget.dart';
import 'package:laregione/screen/ShoppingSearchScreen.dart';
import 'package:laregione/widget/appBar.dart';
import 'package:laregione/widget/customDrawer.dart';
import 'package:laregione/screen/favoriteScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'bookMarkScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
    themeData = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: customAppBar(context,scaffoldKey),
      body: PersistentTabView(context,
          controller: _controller,
          screens: [
            NewsCarouselWidget(),
            ShoppingSearchScreen(
              rootContext: context,
            ),
            FavoriteScreen(
              rootContext: context,
            ),
            BookMarkScreen(
              withAppBar: false,
            )
          ],
          items: [
            PersistentBottomNavBarItem(
                icon: Icon(
                  MdiIcons.home,
                  color: themeData.colorScheme.primary,
                ),
                inactiveIcon: Icon(
                  MdiIcons.homeVariantOutline,
                  color: themeData.colorScheme.onBackground,
                ),
                title: 'Home'),
            PersistentBottomNavBarItem(
                icon: Icon(
                  MdiIcons.hamburger,
                  color: themeData.colorScheme.primary,
                ),
                inactiveIcon: Icon(
                  MdiIcons.hamburger,
                  color: themeData.colorScheme.onBackground,
                ),
                title: 'Categories'),
            PersistentBottomNavBarItem(
                icon: Icon(
                  MdiIcons.heart,
                  color: themeData.colorScheme.primary,
                ),
                inactiveIcon: Icon(
                  MdiIcons.heartOutline,
                  color: themeData.colorScheme.onBackground,
                ),
                title: 'Favorties'),
            PersistentBottomNavBarItem(
                icon: Icon(
                  Icons.search_rounded,
                  color: themeData.colorScheme.primary,
                ),
                inactiveIcon: Icon(
                  Icons.search_rounded,
                  color: themeData.colorScheme.onBackground,
                ),
                title: 'Bookmarks')
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
              .style14 // Choose the nav bar style with this property.
          ),
    );
  }
}
