import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/HomePage.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellow, primary: Colors.yellow),
        ),
        home: HomePage());
  }
}
