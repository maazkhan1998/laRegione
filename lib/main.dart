import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laregione/screen/home_screen.dart';
import 'package:laregione/utils/route_generator.dart';
import 'package:laregione/utils/routes.dart';
import 'utils/AppTheme.dart';

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
      home: HomeScreen(),
      initialRoute: Routes.onboarding,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
