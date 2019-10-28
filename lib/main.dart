import 'package:couper/Screens/deals/special_details.dart';
import 'package:couper/Screens/home/home.dart';
import 'package:couper/Screens/login&registration/login.dart';
import 'package:couper/widgets/fade_page_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configs/AppColors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.grey[200],
      title: 'Couper',
      theme: ThemeData(
        textTheme:
            Theme.of(context).textTheme.apply(displayColor: AppColors.black),
        scaffoldBackgroundColor: Colors.grey[200],
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return FadeRoute(page: Home());
      case "/Home":
        return FadeRoute(page: Home());
     
      default:
        return null;
    }
  }
}
