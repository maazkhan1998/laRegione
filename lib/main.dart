import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laregione/screen/onboarding_screen.dart';
import 'screen/home/home_screen.dart';
import 'utils/route_generator.dart';
import 'utils/routes.dart';
import 'utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: OnboardingScreen(),
      initialRoute: Routes.onboarding,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
