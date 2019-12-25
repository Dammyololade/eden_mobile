import 'package:eden_mobile/AppConfig.dart';
import 'package:eden_mobile/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Avenir',
        primaryColor: AppConfig.APP_PRIMARY_COLOR,
        secondaryHeaderColor: AppConfig.APP_PRIMARY_COLOR_DARK,
        accentColor: AppConfig.APP_ACCENT_COLOR
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
