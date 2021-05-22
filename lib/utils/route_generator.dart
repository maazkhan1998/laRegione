import 'package:flutter/material.dart';
import '../screen/info/about_us_screen.dart';
import '../screen/info/contact_us_scren.dart';
import '../screen/info/info_screen.dart';
import '../models/post.dart';
import '../screen/home/home_screen.dart';
import '../screen/onboarding_screen.dart';
import '../screen/post/post_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.info:
        return MaterialPageRoute(builder: (_) => InfoScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.about:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.contact:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());
      case Routes.post:
        // Validation of correct data type
        if (args is Post) {
          return MaterialPageRoute(
            builder: (_) => PostScreen(
              post: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
