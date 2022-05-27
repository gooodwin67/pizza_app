import 'package:flutter/material.dart';
import 'package:pizza_app/screens/main_screen/main_screen.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreenWidget()));
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Center(
                child: Image.asset('assets/images/logo.png'),
              ),
              Positioned.fill(
                bottom: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Разработано в '),
                      Text(
                        'LightCourse',
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 20, 20),
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
