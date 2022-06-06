import 'package:flutter/material.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_top_image.dart';

class DetailedProdScreen extends StatelessWidget {
  const DetailedProdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailedProdImage(),
      ),
    );
  }
}
