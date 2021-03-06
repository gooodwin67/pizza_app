import 'package:flutter/material.dart';
import 'package:pizza_app/providers.dart';
import 'package:pizza_app/screens/cart_screen/cart_wrap.dart';
import 'package:pizza_app/screens/detailed_screen/detailed_prod.dart';
import 'package:pizza_app/screens/main_screen/main_screen.dart';
import 'package:pizza_app/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Categories()),
    ],
    child: PizzaApp(),
  ));
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,

      home: SplashScreenWidget(),
      //home: MainScreenWidget(),
    );
  }
}
