import 'package:covid19app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 App',
      theme: ThemeData(
        primaryColor: PrimaryColor,
        scaffoldBackgroundColor: BackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: TextColor),
      ),
      home: HomePage(),
    );
  }
}