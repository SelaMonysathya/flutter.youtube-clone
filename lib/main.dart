import 'package:flutter/material.dart';
import 'package:youtube_clone/pages/dashboard/dashboard_page.dart';
import 'package:youtube_clone/themes/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: dark,
        scaffoldBackgroundColor: dark,
        appBarTheme: AppBarTheme(color: dark, elevation: 0),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: white),
        ),
        iconTheme: IconThemeData(color: white)
      ),
      home: const DashboardPage(),
    );
  }
}