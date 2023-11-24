import 'package:flutter/material.dart';
import 'package:random_users/persentation/home_page.dart';
import 'package:random_users/persentation/result_page.dart';

void main() {
  runApp(const RandomUserApp());
}

class RandomUserApp extends StatelessWidget {
  const RandomUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Radnom Users Application",
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      routes: {
        '/': (context) => HomePage(),
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}
