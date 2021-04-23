import 'package:flutter/material.dart';
import 'package:login_example/src/app/pages/login/login_page.dart';
import 'package:login_example/src/core/route/navigation_service.dart';

import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.navigationKey,
      home: LoginPage(),
      routes: {
        // SplashPage.routeName: (BuildContext context) => SplashPage(),
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
      },
    );
  }
}
