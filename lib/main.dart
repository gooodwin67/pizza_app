import 'package:flutter/material.dart';
import 'package:pizza_app/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenWidget(),
    );
  }
}
