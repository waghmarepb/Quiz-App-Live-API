import 'package:flutter/material.dart';

import './screen/category_meals.dart';
import './screen/categories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo API',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.white,
        errorColor: Colors.red,
        fontFamily: 'Poppins',
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Categories(),
        '/category-meals': (ctx) => CotegoryMeals(),
      },
    );
  }
}
