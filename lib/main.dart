import 'package:flutter/material.dart';
import 'package:mercado/pages/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.orange[900])),
      home: HomePage(),
    );
  }
}
